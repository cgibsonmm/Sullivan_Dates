require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  test "invaild user info " do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: {first_name: " ", last_name: " ", email: "invaild@user", zip_code: "11111"}
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid sigup info" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {first_name: "Example", last_name: "User", email: "user@example.com", zip_code: "12701"}
    end
    assert_template 'home/welcome'
    assert_not flash.nil?
  end
end
