require_relative('../db/sql_runner')

class Sport

  attr_reader(:id, :name, :score_method)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @score_method = options['score_method']
  end

end