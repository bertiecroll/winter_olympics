require('date')
require_relative('../db/sql_runner')

class Athlete

  attr_reader(:id, :date_of_birth)
  attr_accessor(:first_name, :last_name, :gender, :nation_id)

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @date_of_birth = Date.parse(options['date_of_birth'])
    @gender = options['gender']
    @nation_id = options['nation_id'].to_i
  end

  def full_name()
    return "#{@first_name} #{@last_name}"
  end

  def dob()
    return @date_of_birth.to_s
  end

  def nation()
    return Nation.find(@nation_id)
  end

  def date_of_birth=(new_dob)
    return @date_of_birth = Date.parse(new_dob)
  end

  def save()
    sql = "INSERT INTO athletes (first_name, last_name, date_of_birth, gender, nation_id)
      VALUES ('#{@first_name}', '#{@last_name}', '#{dob()}', '#{@gender}', #{@nation_id})
      RETURNING *"
    athlete = SqlRunner.run(sql).first
    @id = athlete['id']
  end

  def delete()
    sql = "DELETE FROM athletes
      WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.update(options)
    sql = "UPDATE athletes
      SET first_name = '#{options['first_name']}', last_name = '#{options['last_name']}', date_of_birth = '#{options['date_of_birth']}', gender = '#{options['gender']}', nation_id = #{options['nation_id']}
      WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM athletes
      WHERE id = #{id}"
    return Athlete.map_item(sql)
  end

  def self.all()
    sql = "SELECT * FROM athletes"
    return Athlete.map_items(sql)
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