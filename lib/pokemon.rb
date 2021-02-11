class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id 
        @name = name 
        @type = type 
        @db = db 
    end 

    def self.save(name, type, db)
        sql = <<-SQL
        INSERT INTO pokemon (name, type) 
        VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
    end 

    def self.find(id, db)
        sql = <<-SQL
        SELECT * FROM pokemon
        WHERE id = ?
        SQL

        row = db.execute(sql, id)[0]
        new_pokemon = self.new(id: row[0], name: row[1], type: row[2], db: db)
        #self.new takes in 4 keyword parameters
        #row is a nested array with 1 element
        #row[0] = the first element
        #row[0] gives id, row[1] gives name, row[2] gives type

    end 

end
