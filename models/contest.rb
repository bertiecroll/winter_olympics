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

end