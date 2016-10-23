require_relative('../db/sql_runner')
require('time')
require('pry-byebug')

class Result

  attr_reader(:id, :score)
  attr_accessor(:athlete_id, :contest_id)

  def initialize(options)
    @id = options['id'].to_i
    @athlete_id = options['athlete_id'].to_i
    @contest_id = options['contest_id'].to_i
    @score = get_score(options['score'])
  end

  def athlete()
    return Athlete.find(@athlete_id)
  end

  def contest()
    return Contest.find(@contest_id)
  end

  def score=(new_value)
    return get_score(new_value)
  end

  def print_score()
    score_method = contest().event.score_method
    case score_method
      when "time"
        print_score = @score.strftime("%H:%M:%S.%L")       
      when "points"
        print_score = @score.to_s
      else
        print_score = @score.to_s
    end
    return print_score
  end

  def save()
    sql = "INSERT INTO results (score, athlete_id, contest_id)
      VALUES ('#{print_score()}', #{@athlete_id}, #{@contest_id})
      RETURNING *"
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i
  end

  def delete()
    sql = "DELETE FROM results
      WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.update(options)
    sql = "UPDATE results
      SET score = '#{options['score']}', athlete_id = #{options['athlete_id']}, contest_id = #{options['contest_id']}
      WHERE id = #{options['id']}"
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

  private

  def get_score(value)
    score_method = contest().event.score_method
    case score_method
      when "time"
        score = Time.parse(value)       
      when "points"
        score = value.to_i
      else
        score = value
    end
    return score
  end

end