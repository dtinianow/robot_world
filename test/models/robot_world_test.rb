require_relative "../test_helper"

class RobotWorldTest < Minitest::Test
  include TestHelpers

  def current_robot_id
    robot_world.all.first.id
  end

  def test_creates_a_robot
    assert_equal 0, robot_world.all.count
    robot = robot_world.create(name: "Bob", city: "Denver")
    assert_equal 1, robot_world.all.count
    robot = robot_world.find(current_robot_id)
    assert_equal "Bob", robot.name
    assert_equal "Denver", robot.city
    assert_instance_of Robot, robot_world.all.first
  end

  def test_find_all_robots
    assert_equal 0, robot_world.all.count
    robot1 = robot_world.create(name: "Bob", city: "Denver")
    robot2 = robot_world.create(name: "Joe", state: "CO")
    assert_equal 2, robot_world.all.count
    assert_instance_of Array, robot_world.all
    assert_instance_of Robot, robot_world.all.first
    assert_equal "Bob", robot_world.all.first.name
  end

  def test_find_one_robot
    robot_world.create(name: "Bob", city: "Denver")
    robot = robot_world.find(current_robot_id)
    assert_instance_of Robot, robot
    assert_equal "Bob", robot.name
  end

  def test_update_robot
    robot_world.create(name: "Bob", city: "Denver")
    robot = robot_world.find(current_robot_id)
    assert_equal "Denver", robot.city
    robot_world.update(current_robot_id, name: "Bob", city: "Philly")
    robot = robot_world.find(current_robot_id)
    assert_equal "Philly", robot.city
  end

  def test_delete_robot
    assert_equal 0, robot_world.all.count
    robot = robot_world.create(name: "Bob", city: "Denver")
    assert_equal 1, robot_world.all.count
    robot_world.destroy(current_robot_id)
    assert_equal 0, robot_world.all.count
  end

end
