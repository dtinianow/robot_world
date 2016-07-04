require_relative "../test_helper"

class UserSeesRobotWorldPagesTest < FeatureTest

  def test_user_sees_index_of_robots
    robot1 = robot_world.create(name: "Bob", state: "CO")
    robot2 = robot_world.create(name: "Joe", department: "Turing")
    visit '/robots'
    within('#all-robot-data') do
      assert page.has_content?("Bob")
      assert page.has_content?("Turing")
    end
  end

  def test_user_can_navigate_to_and_from_dashboard
    visit '/'
    within 'body' do
      assert page.has_content?("Welcome to the Robot Kingdom")
    end
    click_on "See All Robots"
    assert_equal "/robots", current_path
    click_on "Return to Homepage"
    assert_equal "/", current_path
    click_on "Create a New Robot"
    assert_equal "/robots/new", current_path
    within ".btn-secondary" do
      click_on "Cancel"
    end
    assert_equal "/", current_path
  end

end
