require_relative('../db/sql_runner')

class Venue

  attr_reader(:id)
  attr_accessor(:name, :location, :capacity)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @location = options['location']
    @capacity = options['capacity'].to_i
  end

  def contests()
    sql = "SELECT * FROM contests
      WHERE venue_id = #{@id}"
    return Contest.map_items(sql)
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

  def self.update(options)
    sql = "UPDATE venues
      SET name = '#{options['name']}', location = '#{options['location']}', capacity = #{options['capacity']}
      WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM venues
      WHERE id = #{id}"
    return Venue.map_item(sql)
  end

  def self.all(query= "")
    query = query.to_s.capitalize
    sql = "SELECT * FROM venues"
    sql += " WHERE location LIKE '%#{query}%'" if query != ""
    return Venue.map_items(sql)
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