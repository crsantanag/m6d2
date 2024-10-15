require "test_helper"

class UserLoginTest < ActionDispatch::IntegrationTest
  test "user can sign up" do
    get signup_path
    assert_response :success
    post users_path, params: { user: { name: "Example User", email: "user@example.com", password: "password" } }
    follow_redirect!
    assert_response :success
    assert_select "h1", "Welcome"
  end
end
