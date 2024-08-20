require 'test_helper'

class Api::V1::VerticalsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @vertical = verticals(:one)
    @user = users(:one)
    @headers = { "Authorization" => "Bearer #{auth_token_for(@user)}" }
  end

  test "should get index" do
    get api_v1_verticals_url, headers: @headers
    assert_response :success
    assert_not_empty response.body
  end

  test "should show vertical" do
    get api_v1_vertical_url(@vertical), headers: @headers
    assert_response :success
    assert_includes response.body, @vertical.name
  end

  test "should create vertical" do
    assert_difference('Vertical.count') do
      post api_v1_verticals_url, params: { vertical: { name: 'New Vertical' } }, headers: @headers
    end
    assert_response :created
  end

  test "should update vertical" do
    patch api_v1_vertical_url(@vertical), params: { vertical: { name: 'Updated Name' } }, headers: @headers
    assert_response :success
    @vertical.reload
    assert_equal 'Updated Name', @vertical.name
  end

  test "should destroy vertical" do
    assert_difference('Vertical.count', -1) do
      delete api_v1_vertical_url(@vertical), headers: @headers
    end
    assert_response :no_content
  end

  private

  def auth_token_for(user)
    Jwt::TokenService.encode(user_id: user.id)
  end
end
