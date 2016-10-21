require_relative('../db/sql_runner')

class Event

  attr_reader(:id, :name, :gender, :sport_id)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @gender = options['gender']
    @sport_id = options['sport_id'].to_i
  end

  def save()
    sql = "INSERT INTO events (name, gender, sport_id)
      VALUES ('#{@name}', '#{@gender}', #{@sport_id})
      RETURNING *"
    event = SqlRunner.run(sql).first
    @id = event['id'].to_i
  end

  def self.map_items(sql)
    events = SqlRunner.run(sql)
    return events.map {|event| Event.new(event)}
  end

  def map_item(sql)
    return Event.map_items(sql).first
  end

end