require_relative('../db/sql_runner')

class Sport

  attr_reader(:id, :name, :score_method)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @score_method = options['score_method']
  end

  def save()
    sql = "INSERT INTO sports (name, score_method)
      VALUES ('#{@name}', '#{@score_method}')
      RETURNING *"
    sport = SqlRunner.run(sql).first
    @id = sport['id'].to_i
  end

  def delete()
    sql = "DELETE FROM sports
      WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM sports
      WHERE id = #{id}"
    return Sport.map_item(sql)
  end

  def self.all()
    sql = "SELECT * FROM sports"
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