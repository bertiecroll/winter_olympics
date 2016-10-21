require('date')
require_relative('../db/sql_runner')

class Athlete

  attr_reader(:id, :first_name, :last_name, :date_of_birth, :nation_id)

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @date_of_birth = Date.parse(options['date_of_birth'])
    @nation_id = options['nation_id'].to_i
  end

  def full_name()
    return "#{@first_name} #{@last_name}"
  end

  def save()
    sql = "INSERT INTO athletes (first_name, last_name, date_of_birth, nation_id)
      VALUES ('#{@first_name}', '#{@last_name}', '#{@date_of_birth.to_s}', #{@nation_id})
      RETURNING *"
    athlete = SqlRunner.run(sql).first
    @id = athlete['id']
  end

  def delete()
    sql = "DELETE FROM athletes
      WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    athletes = SqlRunner.run(sql)
    return athletes.map {|athlete| Athlete.new(athlete)}
  end

  def self.map_item(sql)
    return Athlete.map_items(sql).first
  end

  def self.delete_all()
    sql = "DELETE FROM athletes"
    SqlRunner.run(sql)
  end

end