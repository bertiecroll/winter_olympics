require_relative('../db/sql_runner')
require('pry-byebug')

class Nation

  attr_reader(:id, :gold, :silver, :bronze)
  attr_accessor(:name, :region)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @region = options['region']
    @gold = options['gold'].to_i
    @silver = options['silver'].to_i
    @bronze = options['bronze'].to_i
  end

  def gold=(amount)
    @gold += amount
    update()
  end

  def silver=(amount)
    @silver += amount
    update()
  end

  def bronze=(amount)
    @bronze += amount
    update()
  end

  def athletes()
    sql = "SELECT * FROM athletes
      WHERE nation_id = #{@id}"
    return Athlete.map_items(sql)
  end

  def reset_medals()
    @gold = 0
    @silver = 0
    @bronze = 0
  end

  def points()
    return @gold * 5 + @silver * 3 + @bronze
  end

  def save()
    sql = "INSERT INTO nations (name, region, gold, silver, bronze)
      VALUES ('#{@name}', '#{@region}', #{@gold}, #{@silver}, #{@bronze})
      RETURNING *"
    nation = SqlRunner.run(sql).first
    @id = nation['id'].to_i
  end

  def update()
    sql = "UPDATE nations
      SET name = '#{@name}', region = '#{@region}', gold = #{@gold}, silver = #{@silver}, bronze = #{@bronze}
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
      SET name = '#{options['name']}', region = '#{options['region']}, gold = #{options['gold']}, silver = #{options['silver']}, bronze = #{options['bronze']}
      WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM nations
      WHERE id = #{id}"
    return Nation.map_item(sql)
  end

  def self.all()
    sql = "SELECT * FROM nations ORDER BY name"
    return Nation.map_items(sql)
  end

  def self.map_items(sql)
    nations = SqlRunner.run(sql)
    return nations.map { |nation| Nation.new(nation) }
  end

  def self.map_item(sql)
    return Nation.map_items(sql).first
  end

  def self.delete_all()
    sql = "DELETE FROM nations"
    SqlRunner.run(sql)
  end

  def self.update_medals()
    Nation.all.each do |nation|
      nation.reset_medals()
    end

    events = Event.all()
    events.each do |event|
      medalists = event.medalists()
      # binding.pry
      if medalists != []
        medalists[0].nation.gold= 1 if medalists[0] != nil
        medalists[1].nation.silver= 1 if medalists[1] != nil
        medalists[2].nation.bronze=  1 if medalists[2] != nil
      end
    end
    return nil
  end

end