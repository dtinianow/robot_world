require_relative '../test_helper'

class UserCanEditARobotTest < FeatureTest

  def current_robot_id
    robot_world.all.first.id
  end

  def test_user_can_edit_a_robot
    robot_world.create(name: "Bob", city: "Denver")
    visit '/robots'
    within (".edit-robot-#{current_robot_id}") do
      click_on ("Edit")
    end
    assert_equal "/robots/#{current_robot_id}/edit", current_path
    fill_in "robot[name]", with: "Joe"
    click_on("Submit Changes")
    assert_equal "/robots", current_path
    within('#all-robot-data') do
      assert page.has_content?("Joe")
    end
  end

end
