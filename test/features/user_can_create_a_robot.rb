require_relative "../test_helper"

class UserCanCreateARobotTest < FeatureTest

  def test_user_can_create_a_robot
    visit "/"
    click_link "Create a New Robot"
    assert_equal "/robots/new", current_path
    fill_in "robot[name]", with: "Bob"
    click_button("Make Robot")
    assert_equal "/robots", current_path
    assert page.has_content?('All the Robots')
    within ("#all-robot-data") do
      assert page.has_content?("Bob")
    end
  end

end
