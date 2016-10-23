require_relative('../db/sql_runner')
require('pry-byebug')

class Nation

  attr_reader(:id, :gold, :silver, :bronze)
  attr_accessor(:name, :region)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @region = options['region']
    @gold = medal_count("gold")
    @silver = medal_count("silver")
    @bronze = medal_count("bronze")
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

  def save()
    sql = "INSERT INTO nations (name, region, gold, silver, bronze)
      VALUES ('#{@name}', '#{@region}', #{@gold}, #{@silver}, #{@bronze})
      RETURNING *"
    nation = SqlRunner.run(sql).first
    @id = nation['id']
  end

  def delete()
    sql = "DELETE FROM nations
      WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.update(options)
    sql = "UPDATE nations
      SET name = '#{options['name']}', region = '#{options['region']}, gold = #{options['gold']}, gold = #{options['silver']}, gold = #{options['bronze']}
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

end