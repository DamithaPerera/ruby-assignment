require 'test_helper'

class Api::V1::CoursesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @course = courses(:one)
    @user = users(:one)
    @headers = { "Authorization" => "Bearer #{auth_token_for(@user)}" }
  end

  test "should get index" do
    get api_v1_courses_url, headers: @headers
    assert_response :success
    assert_not_empty response.body
  end

  test "should show course" do
    get api_v1_course_url(@course), headers: @headers
    assert_response :success
    assert_includes response.body, @course.name
  end

  test "should create course" do
    assert_difference('Course.count') do
      post api_v1_courses_url, params: { course: { name: 'New Course', author: 'Author Name', category_id: 1 } }, headers: @headers
    end
    assert_response :created
  end

  test "should update course" do
    patch api_v1_course_url(@course), params: { course: { name: 'Updated Name' } }, headers: @headers
    assert_response :success
    @course.reload
    assert_equal 'Updated Name', @course.name
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete api_v1_course_url(@course), headers: @headers
    end
    assert_response :no_content
  end

  private

  def auth_token_for(user)
    Jwt::TokenService.encode(user_id: user.id)
  end
end
