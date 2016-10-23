require_relative('../db/sql_runner')
require('pry-byebug')

class Nation

  attr_reader(:id)
  attr_accessor(:name, :region, :points)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @region = options['region']
    @points = options['points'].to_i
  end

  def athletes()
    sql = "SELECT * FROM athletes
      WHERE nation_id = #{@id}"
    return Athlete.map_items(sql)
  end

  def medal_count(medal)
    medal_count = 0
    events = Event.all()
    events.each do |event|
      if event.medalist(medal) != nil
        medal_count += 1 if event.medalist(medal).nation_id == @id
      end
    end
    return medal_count
  end

  def gold_count()
    return medal_count("gold")
  end

  def silver_count()
    return medal_count("silver")
  end

  def bronze_count()
    return medal_count("bronze")
  end

  def get_points()
    @points = gold_count() * 5 + silver_count() * 3 + bronze_count()
    update()
  end

  def save()
    sql = "INSERT INTO nations (name, region, points)
      VALUES ('#{@name}', '#{@region}', #{@points})
      RETURNING *"
    nation = SqlRunner.run(sql).first
    @id = nation['id'].to_i
  end

  def update()
    sql = "UPDATE nations
      SET name = '#{@name}', region = '#{@region}', points = #{@points}
      WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM nations
      WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.update(options)
    sql = "UPDATE nations
      SET name = '#{options['name']}', region = '#{options['region']}, points = #{options['points']}
      WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM nations
      WHERE id = #{id}"
    return Nation.map_item(sql)
  end

  def self.all()
    sql = "SELECT * FROM nations"
    return Nation.map_items(sql)
  end

  def self.map_items(sql)
    nations = SqlRunner.run(sql)
    return nations.map {|nation| Nation.new(nation)}
  end

  def self.map_item(sql)
    return Nation.map_items(sql).first
  end

  def self.delete_all()
    sql = "DELETE FROM nations"
    SqlRunner.run(sql)
  end

  def self.update_points()
    Nation.all.each {|nation| nation.get_points}
  end

end