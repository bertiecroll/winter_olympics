require_relative('../db/sql_runner')

class Team
  
  attr_reader(:id, :name, :player_count, :nation_id)
  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @player_count = options['player_count'].to_i
    @nation_id = options['nation_id'].to_i
  end

  def nation()
    return Nation.find(@nation_id)
  end

  def save()
    sql = "INSERT INTO teams (name, player_count, nation_id)
      VALUES ('#{@name}', #{@player_count}, #{@nation_id})
      RETURNING *"
    team = SqlRunner.run(sql).first
    @id = team['id']
  end

  def delete()
    sql = "DELETE FROM teams
      WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.update(options)
    sql = "UPDATE teams
      SET name = '#{options['name']}', player_count = #{options['player_count']}, nation_id = #{options['nation_id']}
      WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM teams
      WHERE id = #{id}"
    return Team.map_item(sql)
  end

  def self.all()
    sql = "SELECT * FROM teams"
    return Team.map_items(sql)
  end

  def self.map_items(sql)
    teams = SqlRunner.run(sql)
    return teams.map {|team| Team.new(team)}
  end

  def self.map_item(sql)
    return Team.map_items(sql).first
  end

  def self.delete_all()
    sql = "DELETE FROM teams"
    SqlRunner.run(sql)
  end

end