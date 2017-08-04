require 'test_helper'

class QuorasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quora = quoras(:one)
  end

  test "should get index" do
    get quoras_url
    assert_response :success
  end

  test "should get new" do
    get new_quora_url
    assert_response :success
  end

  test "should create quora" do
    assert_difference('Quora.count') do
      post quoras_url, params: { quora: { content: @quora.content, question_id: @quora.question_id } }
    end

    assert_redirected_to quora_url(Quora.last)
  end

  test "should show quora" do
    get quora_url(@quora)
    assert_response :success
  end

  test "should get edit" do
    get edit_quora_url(@quora)
    assert_response :success
  end

  test "should update quora" do
    patch quora_url(@quora), params: { quora: { content: @quora.content, question_id: @quora.question_id } }
    assert_redirected_to quora_url(@quora)
  end

  test "should destroy quora" do
    assert_difference('Quora.count', -1) do
      delete quora_url(@quora)
    end

    assert_redirected_to quoras_url
  end
end
