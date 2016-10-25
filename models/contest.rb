require('time')
require_relative('../db/sql_runner')
require('pry-byebug')

class Contest

  attr_reader(:id)
  attr_accessor(:name, :date_time, :event_id, :venue_id)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name'].capitalize
    @date_time = Time.parse(options['date_time'])
    @event_id = options['event_id'].to_i
    @venue_id = options['venue_id'].to_i
  end

  def full_name()
    event = event()
    return "#{event.sport.name} #{event.name} #{event.class.capitalize} #{@name}"
  end

  def dt()
    return @date_time.strftime("%Y-%m-%d %R")
  end

  def date()
    return @date_time.strftime("%Y-%m-%d")
  end

  def time()
    return @date_time.strftime("%R")
  end

  def event()
    return Event.find(event_id)
  end

  def venue()
    return Venue.find(venue_id)
  end

  def results()
    order = get_order()
    result_table = get_result_table()

    sql = "SELECT * FROM #{result_table}
      WHERE contest_id = #{@id} ORDER BY score #{order}"
    result_table == "results" ? result = Result.map_items(sql) : result = TeamResult.map_items(sql)
    return result
  end

  def get_medalists()
    order = get_order()
    result_table = get_result_table()
    if result_table == "results"
      sql = "SELECT a.* FROM athletes a INNER JOIN results r ON a.id = r.athlete_id WHERE r.contest_id = #{@id} ORDER BY r.score #{order} LIMIT 3"
    else
      sql = "SELECT t.* FROM teams t INNER JOIN team_results r ON t.id = r.team_id WHERE r.contest_id = #{@id} ORDER BY r.score #{order} LIMIT 3"  
    end
    
    result_table == "results" ? result = Athlete.map_items(sql) : result = Team.map_items(sql)
    return result
  end

  def save()
    sql = "INSERT INTO contests (name, date_time, event_id, venue_id)
      VALUES ('#{@name}', '#{dt()}', #{@event_id}, #{@venue_id})
      RETURNING *"
    contest = SqlRunner.run(sql).first
    @id = contest['id'].to_i
  end

  def delete()
    sql = "DELETE FROM contests
      WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.dates()
    sql = "SELECT date_time FROM contests"
    dates = SqlRunner.run(sql).map {|item| item['date_time'].split()[0]}
    return dates.uniq
  end

  def self.finals()
    sql = "SELECT * FROM contests
      WHERE name = 'Final'"
    return Contest.map_items(sql)
  end

  def self.update(options)
    sql = "UPDATE contests
      SET name = '#{options['name']}', date_time = '#{options['date_time']}', event_id = #{options['event_id']}, venue_id = #{options['venue_id']}
      WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM contests
      WHERE id = #{id}"
    return Contest.map_item(sql)
  end

  def self.all()
    sql = "SELECT * FROM contests"
    return Contest.map_items(sql)
  end

  def self.map_items(sql)
    contests = SqlRunner.run(sql)
    return contests.map {|contest| Contest.new(contest)}
  end

  def self.map_item(sql)
    return Contest.map_items(sql).first
  end

  def self.delete_all()
    sql = "DELETE FROM contests"
    SqlRunner.run(sql)
  end

  private

  def get_order()
    if event().score_method == "time"
      order = "ASC"
    else
      order = "DESC" 
    end
    return order
  end

  def get_result_table()
    event().team_size == 1 ? table = "results" : table = "team_results"
    return table
  end
end