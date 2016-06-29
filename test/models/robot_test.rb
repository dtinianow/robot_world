require_relative '../test_helper'

class RobotTest < Minitest::Test

  def test_assigns_attributes_correctly
    data = {"id" => "2", "name" => "JoeRobot"}
    robot = Robot.new(data)
    assert_equal "2", robot.id
    assert_equal "JoeRobot", robot.name 
  end

end
