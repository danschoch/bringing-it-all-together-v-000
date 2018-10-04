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

  def self.new_from_db (row)
    self.new (row[0], row[1], row[2])
  end

  def self.find_by_name (name)

  end

  def self.find_by_id(id)

  end

  def self.create

  end

  def update

  end

  def

  end

  def save
    if self.id?
      self.update
    else

      #save functionality
    end
  end


end
