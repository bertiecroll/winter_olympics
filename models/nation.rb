require_relative('../db/sql_runner')

class Nation

  attr_reader(:id, :name, :region)
  
  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @region = options['region']
  end

end