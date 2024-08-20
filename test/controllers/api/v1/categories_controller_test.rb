require 'test_helper'

class Api::V1::CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = categories(:one)
    @user = users(:one)
    @headers = { "Authorization" => "Bearer #{auth_token_for(@user)}" }
  end

  test "should get index" do
    get api_v1_categories_url, headers: @headers
    assert_response :success
    assert_not_empty response.body
  end

  test "should show category" do
    get api_v1_category_url(@category), headers: @headers
    assert_response :success
    assert_includes response.body, @category.name
  end

  test "should create category" do
    assert_difference('Category.count') do
      post api_v1_categories_url, params: { category: { name: 'New Category', vertical_id: 1 } }, headers: @headers
    end
    assert_response :created
  end

  test "should update category" do
    patch api_v1_category_url(@category), params: { category: { name: 'Updated Name' } }, headers: @headers
    assert_response :success
    @category.reload
    assert_equal 'Updated Name', @category.name
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete api_v1_category_url(@category), headers: @headers
    end
    assert_response :no_content
  end

  private

  def auth_token_for(user)
    Jwt::TokenService.encode(user_id: user.id)
  end
end