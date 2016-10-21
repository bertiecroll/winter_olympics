require_relative('../db/sql_runner')

class Nation

  attr_reader(:id, :name, :region)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @region = options['region']
  end

  def save()
    sql = "INSERT INTO nations (name, region)
      VALUES ('#{@name}', '#{@region}')
      RETURNING *"
    nation = SqlRunner.run(sql).first
    @id = nation['id']
  end

  def delete()
    sql = "DELETE FROM nations
      WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM nations"
    SqlRunner.run(sql)
  end

end