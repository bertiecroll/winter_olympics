require_relative('../db/sql_runner')

class Team
  
  attr_reader(:id, :event_id, :nation_id)
  def initialize(options)
    @id = options['id'].to_i
    @event_id = options['event_id'].to_i
    @nation_id = options['nation_id'].to_i
  end

  def nation()
    return Nation.find(@nation_id)
  end

  def event()
    return Event.find(@event_id)
  end

  def name()
    team_event = event()
    return "#{team_event.sport.name} #{team_event.name} #{team_event.class.capitalize}" 
  end

  def athletes()
    sql = "SELECT a.* FROM athletes a INNER JOIN athletes_teams at
      ON a.id = at.athlete_id 
      WHERE at.team_id = #{@id}"
    return Athlete.map_items(sql)
  end

  def athlete_count()
    sql = "SELECT count(*) FROM athletes a INNER JOIN athletes_teams at
      ON a.id = at.athlete_id 
      WHERE at.team_id = #{@id}"
    result = SqlRunner.run(sql).first
    return result['count'].to_i
  end

  def athlete_team()
    sql = "SELECT * FROM athletes_teams
      WHERE team_id = #{@id}"
      return AthleteTeam.map_item(sql)
  end

  def has_result?(contest_id)
    sql = "SELECT count(*) FROM team_results WHERE team_id=#{@id} AND contest_id=#{contest_id}"
    sql_result = SqlRunner.run(sql).first
    count = sql_result['count'].to_i
    return count < 1 ? false : true 
  end

  def has_athlete?(athlete_id)
    sql = "SELECT count(*) FROM athletes_teams WHERE team_id=#{@id} AND athlete_id=#{athlete_id}"
    sql_result = SqlRunner.run(sql).first
    count = sql_result['count'].to_i
    return count < 1 ? false : true
  end

  def save()
    sql = "INSERT INTO teams (event_id, nation_id)
      VALUES (#{@event_id}, #{@nation_id})
      RETURNING *"
    team = SqlRunner.run(sql).first
    @id = team['id']
  end

  def delete()
    sql = "DELETE FROM teams
      WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.update(options)
    sql = "UPDATE teams
      SET event_id = #{options['event_id']}, nation_id = #{options['nation_id']}
      WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM teams
      WHERE id = #{id}"
    return Team.map_item(sql)
  end

  def self.all(query= "")
    query = query.to_s.capitalize
    sql = "SELECT t.* FROM teams t INNER JOIN nations n ON t.nation_id = n.id"
    sql += " WHERE n.name LIKE '%#{query}%'" if query != ""
    return Team.map_items(sql)
  end

  def self.map_items(sql)
    teams = SqlRunner.run(sql)
    return teams.map {|team| Team.new(team)}
  end

  def self.map_item(sql)
    return Team.map_items(sql).first
  end

  def self.delete_all()
    sql = "DELETE FROM teams"
    SqlRunner.run(sql)
  end

end