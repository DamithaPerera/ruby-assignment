require 'test_helper'

class Api::V1::AuthControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)  # Assumes you have a user fixture named :one
  end

  test "should sign in with valid credentials" do
    post api_v1_sign_in_url, params: { auth: { email: @user.email, password: 'password123' } }
    assert_response :ok
    assert_includes json_response.keys, 'token'
  end

  test "should not sign in with invalid credentials" do
    post api_v1_sign_in_url, params: { auth: { email: @user.email, password: 'wrongpassword' } }
    assert_response :unauthorized
    assert_equal json_response['error'], 'Invalid credentials'
  end

  test "should handle exceptions during sign in" do
    User.any_instance.stubs(:valid_password?).raises(StandardError.new("Something went wrong"))

    post api_v1_sign_in_url, params: { auth: { email: @user.email, password: 'password123' } }
    assert_response :internal_server_error
    assert_equal json_response['error'], 'Internal server error'
  end

  test "should sign out successfully" do
    delete api_v1_sign_out_url
    assert_response :no_content
  end

  private

  def json_response
    @json_response ||= JSON.parse(response.body)
  end
end
