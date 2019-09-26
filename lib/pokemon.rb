class Pokemon
  attr_reader :name, :type, :id, :db

  def initialize(name:, type:, id: nil, db: nil)
    @name = name
    @type = type
    @id = id
    @db = db
  end

  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    result = db.execute(sql, id).first
    new(id: result[0], name: result[1], type: result[2])
  end
end
