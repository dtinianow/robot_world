class RobotWorld
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.execute("INSERT INTO robots (name, city, state, avatar, birthdate, date_hired, department)
                      VALUES (?, ?, ?, ?, ?, ?, ?);",
                      robot[:name],
                      robot[:city],
                      robot[:state],
                      robot[:avatar],
                      robot[:birthdate],
                      robot[:date_hired],
                      robot[:department])
  end

  def raw_robots
    database.execute("SELECT * FROM robots;")
  end

  def all
    raw_robots.map { |data| Robot.new(data) }
  end

  def raw_robot(id)
    raw_robots.find { |robot| robot["id"] == id }
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def update(id, robot)
    database.execute("UPDATE robots SET name= ?,
                                        city= ?,
                                        state= ?,
                                        avatar= ?,
                                        birthdate= ?,
                                        date_hired= ?,
                                        department= ?
                                        WHERE id= ?;",
                                        robot[:name],
                                        robot[:city],
                                        robot[:state],
                                        robot[:avatar],
                                        robot[:birthdate],
                                        robot[:date_hired],
                                        robot[:department],
                                        id)
  end

  def destroy(id)
    database.execute("DELETE FROM robots WHERE id= ?;", id)
  end

  def delete_all
    database.execute("DELETE FROM robots;")
  end

  def generate_fake_data
    { name: Faker::Name.first_name,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      avatar: Faker::Lorem.word,
      birthdate: Faker::Date.between('1948-01-01', '2009-12-31'),
      date_hired: Faker::Date.between('2010-01-01', Date.today),
      department: Faker::Commerce.department
    }
  end
end
