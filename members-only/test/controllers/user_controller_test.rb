require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get username:string" do
    get user_username:string_url
    assert_response :success
  end

  test "should get email:string" do
    get user_email:string_url
    assert_response :success
  end
end
