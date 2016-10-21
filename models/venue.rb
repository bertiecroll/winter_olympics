require_relative('../db/sql_runner')

class Venue

  attr_reader(:id, :name, :location, :capacity)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @location = options['location']
    @capacity = options['capacity'].to_i
  end

end