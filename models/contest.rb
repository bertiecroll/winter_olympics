require_relative('../db/sql_runner')

class Contest

  attr_reader(:id, :name, :event_id, :venue_id)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @event_id = options['event_id'].to_i
    @venue_id = options['venue_id'].to_i
  end

  def event()
    return Event.find(event_id)
  end

  def venue()
    return Venue.find(venue_id)
  end

  def save()
    sql = "INSERT INTO contests (name, event_id, venue_id)
      VALUES ('#{@name}', #{@event_id}, #{@venue_id})
      RETURNING *"
    contest = SqlRunner.run(sql).first
    @id = contest['id'].to_i
  end

  def self.map_items(sql)
    contests = SqlRunner.run(sql)
    return contests.map {|contest| Contest.new(contest)}
  end

  def self.map_item(sql)
    return Contest.map_items(sql).first
  end

end