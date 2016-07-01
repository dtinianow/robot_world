require 'sqlite3'

database = SQLite3::Database.new("db/robot_world_development.db")

database.execute("DELETE FROM robots;")

database.execute("INSERT INTO robots (name, city, state, avatar, birthdate, date_hired, department)
              VALUES ('Bob', 'Denver', 'CO', 'asdf', '1/1/2000', '6/1/2016', 'Turing'),
              ('Joe', 'Philly', 'PA', 'thge', '12/31/1900', '6/27/2016', 'Stuff');"
              )


puts database.execute("SELECT * FROM robots;")
