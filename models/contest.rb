require_relative('../db/sql_runner')

class Contest

  attr_reader(:id)
  attr_accessor(:name, :event_id, :venue_id)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name'].capitalize
    @event_id = options['event_id'].to_i
    @venue_id = options['venue_id'].to_i
  end

  def event()
    return Event.find(event_id)
  end

  def venue()
    return Venue.find(venue_id)
  end

  def results()
    order = get_order()
    sql = "SELECT * FROM results
      WHERE contest_id = #{@id} ORDER BY score #{order}"
    return Result.map_items(sql)
  end

  def get_athlete(position)
    order = get_order()
    sql = "SELECT a.* FROM athletes a INNER JOIN results r
      ON a.id = r.athlete_id
      WHERE r.contest_id = #{@id}
      ORDER BY r.score #{order} LIMIT 1 OFFSET #{position}"
    return Athlete.map_item(sql)
  end

  def save()
    sql = "INSERT INTO contests (name, event_id, venue_id)
      VALUES ('#{@name}', #{@event_id}, #{@venue_id})
      RETURNING *"
    contest = SqlRunner.run(sql).first
    @id = contest['id'].to_i
  end

  def delete()
    sql = "DELETE FROM contests
      WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.finals()
    sql = "SELECT * FROM contests
      WHERE name = 'Final'"
    return Contest.map_items(sql)
  end

  def self.update(options)
    sql = "UPDATE contests
      SET name = '#{options['name']}', event_id = #{options['event_id']}, venue_id = #{options['venue_id']}
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

end