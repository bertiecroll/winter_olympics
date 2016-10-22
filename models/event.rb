require_relative('../db/sql_runner')

class Event

  attr_reader(:id)
  attr_accessor(:name, :class, :score_method, :sport_id)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @class = options['class']
    @score_method = options['score_method']
    @sport_id = options['sport_id'].to_i
  end

  def sport()
    return Sport.find(@sport_id)
  end

  def save()
    sql = "INSERT INTO events (name, class, score_method, sport_id)
      VALUES ('#{@name}', '#{@class}', '#{@score_method}', #{@sport_id})
      RETURNING *"
    event = SqlRunner.run(sql).first
    @id = event['id'].to_i
  end

  def update()
    sql = "UPDATE events
      SET name = '#{@name}', class = '#{@class}', score_method = '#{@score_method}', sport_id = #{@sport_id}
      WHERE id = #{@id}"
    SqlRunner.run(sql)
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