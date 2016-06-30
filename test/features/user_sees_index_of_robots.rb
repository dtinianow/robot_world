require_relative "../test_helper"

class UserSeesIndexOfRobotsTest < FeatureTest

  def test_user_sees_index_of_robots
    robot1 = task_manager.create(name: "Bob", state: "CO")
    robot2 = task_manager.create(name: "Joe", department: "Turing")
    visit '/robots'
    within('#all-robot-data') do
      assert page.has_content?("Bob")
      assert page.has_content?("Turing")
    end
  end

end
