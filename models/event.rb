require_relative('../db/sql_runner')
require('pry-byebug')

class Event

  attr_reader(:id)
  attr_accessor(:name, :class, :score_method, :team_size, :sport_id)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @class = options['class']
    @score_method = options['score_method']
    @team_size = options['team_size'].to_i
    @sport_id = options['sport_id'].to_i
  end

  def sport()
    return Sport.find(@sport_id)
  end

  def contests()
    sql = "SELECT * FROM contests
      WHERE event_id = #{@id}"
    return Contest.map_items(sql)
  end

  def final()
    sql = "SELECT * FROM contests
      WHERE event_id = #{@id} AND name = 'Final'"
    return Contest.map_item(sql)
  end

  def medalists()
    contest = final()
    return nil if contest == nil
    return contest.get_medalists()
  end

  def save()
    sql = "INSERT INTO events (name, class, score_method, team_size, sport_id)
      VALUES ('#{@name}', '#{@class}', '#{@score_method}', #{@team_size}, #{@sport_id})
      RETURNING *"
    event = SqlRunner.run(sql).first
    @id = event['id'].to_i
  end

  def delete()
    sql = "DELETE FROM events
      WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.update(options)
    sql = "UPDATE events
      SET name = '#{options['name']}', class = '#{options['class']}', score_method = '#{options['score_method']}', team_size = #{options['team_size']} sport_id = #{options['sport_id']}
      WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM events
      WHERE id = #{id}"
    return Event.map_item(sql)
  end

  def self.all()
    sql = "SELECT * FROM events"
    return Event.map_items(sql)
  end

  def self.map_items(sql)
    events = SqlRunner.run(sql)
    return events.map {|event| Event.new(event)}
  end

  def self.map_item(sql)
    return Event.map_items(sql).first
  end

  def self.delete_all()
    sql = "DELETE FROM events"
    SqlRunner.run(sql)
  end

end