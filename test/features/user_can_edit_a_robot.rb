require_relative '../test_helper'

class UserCanEditARobotTest < FeatureTest

  def test_user_can_edit_a_robot
    robot_world.create(name: "Bob", city: "Denver")
    visit '/robots'
    click_on("Edit")
    assert_equal "/robots/1/edit", current_path
    fill_in "robot[name]", with: "Joe"
    click_on("Submit Changes")
    assert_equal "/robots", current_path
    within('#all-robot-data') do
      assert page.has_content?("Joe")
    end
  end

end
