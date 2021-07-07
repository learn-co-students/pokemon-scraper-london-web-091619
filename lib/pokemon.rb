require "pry"

class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = "INSERT INTO pokemon(name, type) VALUES (?, ?)"
    db.execute(sql, name, type)
  end

  def self.find(pokemon_id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    result = db.execute(sql, pokemon_id).flatten
    Pokemon.new(id: result[0], name: result[1], type: result[2], db: result[3])
  end
end
