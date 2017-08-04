require 'test_helper'

class CourseMakersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_maker = course_makers(:one)
  end

  test "should get index" do
    get course_makers_url
    assert_response :success
  end

  test "should get new" do
    get new_course_maker_url
    assert_response :success
  end

  test "should create course_maker" do
    assert_difference('CourseMaker.count') do
      post course_makers_url, params: { course_maker: { course_id: @course_maker.course_id, page_content: @course_maker.page_content, page_heading: @course_maker.page_heading, page_number: @course_maker.page_number } }
    end

    assert_redirected_to course_maker_url(CourseMaker.last)
  end

  test "should show course_maker" do
    get course_maker_url(@course_maker)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_maker_url(@course_maker)
    assert_response :success
  end

  test "should update course_maker" do
    patch course_maker_url(@course_maker), params: { course_maker: { course_id: @course_maker.course_id, page_content: @course_maker.page_content, page_heading: @course_maker.page_heading, page_number: @course_maker.page_number } }
    assert_redirected_to course_maker_url(@course_maker)
  end

  test "should destroy course_maker" do
    assert_difference('CourseMaker.count', -1) do
      delete course_maker_url(@course_maker)
    end

    assert_redirected_to course_makers_url
  end
end
