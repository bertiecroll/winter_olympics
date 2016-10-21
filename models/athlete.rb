require_relative('../db/sql_runner')

class Athlete

  attr_reader(:id, :first_name, :last_name, :date_of_birth, :nation_id)

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @date_of_birth = options['date_of_birth'].to_s
    @nation_id = options['nation_id'].to_i
  end

  def full_name()
    return "#{@first_name} #{@last_name}"
  end

end