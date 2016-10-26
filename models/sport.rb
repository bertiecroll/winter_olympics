require_relative('../db/sql_runner')

class Sport

  attr_reader(:id)
  attr_accessor(:name)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def events()
    sql = "SELECT * FROM events
      WHERE sport_id = #{@id}"
    return Event.map_items(sql)
  end

  def save()
    sql = "INSERT INTO sports (name)
      VALUES ('#{@name}')
      RETURNING *"
    sport = SqlRunner.run(sql).first
    @id = sport['id'].to_i
  end

  def delete()
    sql = "DELETE FROM sports
      WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.update(options)
    sql = "UPDATE sports
      SET name = '#{options['name']}'
      WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM sports
      WHERE id = #{id}"
    return Sport.map_item(sql)
  end

  def self.all(query= 0)
    query = query.to_i
    sql = "SELECT * FROM sports"
    sql += " WHERE id = #{query}" if query != 0
    return Sport.map_items(sql)
  end

  def self.map_items(sql)
    sports = SqlRunner.run(sql)
    return sports.map {|sport| Sport.new(sport)}
  end

  def self.map_item(sql)
    return Sport.map_items(sql).first
  end

  def self.delete_all()
    sql = "DELETE FROM sports"
    SqlRunner.run(sql)
  end

end