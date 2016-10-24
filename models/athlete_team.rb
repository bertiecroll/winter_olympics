require_relative('../db/sql_runner')

class AthleteTeam
  
  attr_reader(:id, :name, :class, :player_count, :nation_id)
  def initialize(options)
    @id = options['id'].to_i
    @team_id = options['team_id'].to_i
    @athlete_id = options['athlete_id'].to_i
  end

  def team()
    return Team.find(@team_id)
  end

  def athlete()
    return Athlete.find(@athlete_id)
  end

  def save()
    sql = "INSERT INTO athletes_teams (team_id, athlete_id)
      VALUES (#{@team_id}, #{@athlete_id})
      RETURNING *"
    athlete_team = SqlRunner.run(sql).first
    @id = athlete_team['id']
  end

  def delete()
    sql = "DELETE FROM athletes_teams
      WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.update(options)
    sql = "UPDATE athletes_teams
      SET team_id = #{options['team_id']}, athlete_id = #{options['athlete_id']}
      WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM athletes_teams
      WHERE id = #{id}"
    return AthleteTeam.map_item(sql)
  end

  def self.all()
    sql = "SELECT * FROM athletes_teams"
    return AthleteTeam.map_items(sql)
  end

  def self.map_items(sql)
    athletes_teams = SqlRunner.run(sql)
    return athletes_teams.map {|athlete_team| AthleteTeam.new(athlete_team)}
  end

  def self.map_item(sql)
    return AthleteTeam.map_items(sql).first
  end

  def self.delete_all()
    sql = "DELETE FROM athletes_teams"
    SqlRunner.run(sql)
  end

end