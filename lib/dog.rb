class Dog
  attr_accessor :name, :breed
  attr_reader :id

  def initialize (id: nil, name:, breed:)
    @id = id
    @name = name
    @breed = breed
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS dogs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        breed TEXT
      )
    SQL

    DB[:conn].execute (sql)
  end

  def self.drop_table
    sql = "DROP TABLE IF EXISTS dogs"
    DB[:conn].execute (sql)
  end

  #def self.new_from_db (row)
    #new_dog = self.new (row[0], row[1], row[2])
    #new_dog
#  end

  def self.find_by_name (name)
    sql = <<-SQL
      SELECT * FROM dogs WHERE name = ?;
    SQL

    DB[:conn].execute(sql, name).map do |row|
      self.new_from_db(row)
    end.first
  end

  def self.find_by_id(id)
    sql = <<-SQL
      SELECT * FROM dogs WHERE id = ?;
    SQL

    DB[:conn].execute (sql, id)
  end

  def self.create (name:, breed:)
    new_dog = self.new(name, breed)
    new_dog.save
    new_dog
  end

  def self.find_or_create_by (name:, breed:)

  def update

  end

  def

  end

  def save
    if self.id?
      self.update
    else
      sql = "INSERT INTO dogs (name, breed) VALUES (?, ?)"
      DB[:conn].execute(sql, self.name, self.breed)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
    end
  end


end
