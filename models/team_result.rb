require_relative('../db/sql_runner')
require('time')
require('pry-byebug')

class TeamResult

  attr_reader(:id, :score)
  attr_accessor(:team_id, :contest_id)

  def initialize(options)
    @id = options['id'].to_i
    @team_id = options['team_id'].to_i
    @contest_id = options['contest_id'].to_i
    @score = get_score(options['score'])
  end

  def team()
    return Team.find(@team_id)
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
    sql = "INSERT INTO team_results (score, team_id, contest_id)
      VALUES ('#{print_score()}', #{@team_id}, #{@contest_id})
      RETURNING *"
    team_result = SqlRunner.run(sql).first
    @id = team_result['id'].to_i
  end

  def delete()
    sql = "DELETE FROM team_results
      WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.update(options)
    sql = "UPDATE team_results
      SET score = '#{options['score']}', team_id = #{options['team_id']}, contest_id = #{options['contest_id']}
      WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM team_results
      WHERE id = #{id}"
    return TeamResult.map_item(sql)
  end

  def self.all()
    sql = "SELECT * FROM team_results"
    return TeamResult.map_items(sql)
  end

  def self.map_items(sql)
    team_results = SqlRunner.run(sql)
    return team_results.map {|team_result| TeamResult.new(team_result)}
  end

  def self.map_item(sql)
    return TeamResult.map_items(sql).first
  end

  def self.delete_all()
    sql = "DELETE FROM team_results"
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