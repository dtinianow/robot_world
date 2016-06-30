require_relative "../test_helper"

class UserCanDeleteARobotTest < FeatureTest

  def test_user_can_delete_a_robot
    robot_world.create(name: "Bob")
    visit '/robots'
    within('#robot-name') do
      assert page.has_content?("Bob")
    end
    click_on("Delete")
    assert_equal '/robots', current_path
    refute page.has_css?('#robot-name')
  end
end
