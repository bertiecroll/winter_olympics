require_relative('../db/sql_runner')

class Result

  attr_reader(:id)
  attr_accessor(:score, :athlete_id, :contest_id)

  def initialize(options)
    @id = options['id'].to_i
    @score = options['score']
    @athlete_id = options['athlete_id'].to_i
    @contest_id = options['contest_id'].to_i
  end

  def athlete()
    return Athlete.find(@athlete_id)
  end

  def contest()
    return Contest.find(@contest_id)
  end

  def save()
    sql = "INSERT INTO results (score, athlete_id, contest_id)
      VALUES ('#{@score}', #{@athlete_id}, #{@contest_id})
      RETURNING *"
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i
  end

  def update()
    sql = "UPDATE results
      SET score = '#{@score}', athlete_id = #{@athlete_id}, contest_id = #{@contest_id}
      WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM results
      WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM results
      WHERE id = #{id}"
    return Result.map_item(sql)
  end

  def self.all()
    sql = "SELECT * FROM results"
    return Result.map_items(sql)
  end

  def self.map_items(sql)
    results = SqlRunner.run(sql)
    return results.map {|result| Result.new(result)}
  end

  def self.map_item(sql)
    return Result.map_items(sql).first
  end

  def self.delete_all()
    sql = "DELETE FROM results"
    SqlRunner.run(sql)
  end

end