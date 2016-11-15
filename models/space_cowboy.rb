require('pg')
class SpaceCowboy
  attr_accessor :name, :species, :bounty_value, :danger_level, :last_known_location, :homeworld, :favourite_weapon, :cashed_in, :collected_by
  attr_reader :id

  def initialize ( options )
    @name = options["name"]
    @species = options["species"]
    @bounty_value = options["bounty_value"].to_i
    @danger_level = options["danger_level"]
    @last_known_location = options["last_known_location"]
    @homeworld = options["homeworld"]
    @favourite_weapon = options["favourite_weapon"]
    @cashed_in = options["cashed_in"]
    @collected_by = options["collected_by"]
    @id = options["id"].to_i if options["id"]

  end

  def save
    db = PG.connect ({dbname: 'space_cowboys', host: 'localhost'})
    sql =
    "INSERT INTO space_cowboys
    (name, species, bounty_value, danger_level, last_known_location, homeworld, favourite_weapon, cashed_in, collected_by)
    VALUES
    ('#{@name}', '#{@species}', #{@bounty_value}, '#{@danger_level}', '#{@last_known_location}', '#{@homeworld}', '#{@favourite_weapon}', #{@cashed_in}, '#{@collected_by}') returning *;"
    result = db.exec(sql)
    @id = result[0]['id'].to_i
    db.close
  end

  def delete
    return unless @id
    db = PG.connect ({dbname: 'space_cowboys', host: 'localhost'})
    sql =
    "DELETE FROM space_cowboys WHERE id =#{@id}"
    db.exec(sql)
    db.close
  end

  def update
    db = PG.connect ({dbname: 'space_cowboys', host: 'localhost'})
    sql =
    "UPDATE space_cowboys 
    SET (name, species, bounty_value, danger_level, last_known_location, homeworld, favourite_weapon, cashed_in, collected_by) = 
        ('#{@name}', '#{@species}', #{@bounty_value}, '#{@danger_level}', '#{@last_known_location}', '#{@homeworld}', '#{@favourite_weapon}', #{@cashed_in}, '#{@collected_by}')  WHERE id = #{@id};"
    db.exec(sql)
    db.close
  end

  def self.all
    db = PG.connect ({dbname: 'space_cowboys', host: 'localhost'})
    sql = "SELECT * FROM space_cowboys;"
    cowboys = db.exec(sql)
    db.close
    return cowboys.map { |hash| SpaceCowboy.new(hash)}
  end

  def self.delete_all
    db = PG.connect ({dbname: 'space_cowboys', host: 'localhost'})
    sql = "DELETE FROM space_cowboys;"
    db.exec(sql)
    db.close
  end

end
