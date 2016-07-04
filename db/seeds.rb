require 'sqlite3'
require 'faker'

database = SQLite3::Database.new("db/robot_world_development.db")

database.execute("DELETE FROM robots;")

2.times do
  database.execute("INSERT INTO robots (name, city, state, avatar, birthdate, date_hired, department)
                VALUES ('#{Faker::Name.first_name}',
                        '#{Faker::Address.city}',
                        '#{Faker::Address.state_abbr}',
                        '#{Faker::Lorem.word}',
                        '#{Faker::Date.between('1948-01-01', '2009-12-31')}',
                        '#{Faker::Date.between('2010-01-01', Date.today)}',
                        '#{Faker::Commerce.department}');"
                        )
end



puts database.execute("SELECT * FROM robots;")
