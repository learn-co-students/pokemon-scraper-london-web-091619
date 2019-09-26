require 'pry'
class Pokemon
    attr_reader :id, :name, :type, :db
    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = "
        INSERT INTO pokemon (name, type)
        VALUES (?,?)
        "
        db.execute(sql,name, type)
    end

    def self.find(id, db)
        sql = "
        SELECT *
        FROM pokemon
        WHERE pokemon.id = ?
        "
        pokemon = db.execute(sql,id)[0]

        self.new(id: pokemon[0],name: pokemon[1], type: pokemon[2],db: db)
    end
end
