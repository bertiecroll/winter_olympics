require_relative('../db/sql_runner')

class Venue

  attr_reader(:id, :name, :location, :capacity)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @location = options['location']
    @capacity = options['capacity'].to_i
  end

  def save()
    sql = "INSERT INTO venues (name, location, capacity)
      VALUES ('#{@name}', '#{@location}', #{@capacity})
      RETURNING *"
    venue = SqlRunner.run(sql).first
    @id = venue['id'].to_i
  end

  def delete()
    sql = "DELETE FROM venues
      WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    venues = SqlRunner.run(sql)
    return venues.map {|venue| Venue.new(venue)}
  end

  def self.map_item(sql)
    return Venue.map_items(sql).first
  end

  def self.delete_all()
    sql = "DELETE FROM venues"
    SqlRunner.run(sql)
  end

end