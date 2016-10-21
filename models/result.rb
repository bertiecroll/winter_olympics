require_relative('../db/sql_runner')

class Result

  attr_reader(:id, :score, :athlete_id, :contest_id)

  def initialize(options)
    @id = options['id'].to_i
    @score = options['score'].to_f
    @athlete_id = options['athlete_id'].to_i
    @contest_id = options['contest_id'].to_i
  end

  def save()
    sql = "INSERT INTO results (score, athlete_id, contest_id)
      VALUES (#{@score}, #{@athlete_id}, #{@contest_id})
      RETURNING *"
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i
  end

end