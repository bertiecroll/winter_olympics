require_relative('../db/sql_runner')

class Event

  attr_reader(:id, :name, :gender, :sport_id)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @gender = options['gender']
    @sport_id = options['sport_id'].to_i
  end

  def sport()
    sql = "SELECT * FROM sports
      WHERE id = #{@sport_id}"
    return Sport.map_item(sql)
  end

  def save()
    sql = "INSERT INTO events (name, gender, sport_id)
      VALUES ('#{@name}', '#{@gender}', #{@sport_id})
      RETURNING *"
    event = SqlRunner.run(sql).first
    @id = event['id'].to_i
  end

  def delete()
    sql = "DELETE FROM events
      WHERE id = #{@id}"
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