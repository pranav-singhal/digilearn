require 'test_helper'

class UserOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_order = user_orders(:one)
  end

  test "should get index" do
    get user_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_user_order_url
    assert_response :success
  end

  test "should create user_order" do
    assert_difference('UserOrder.count') do
      post user_orders_url, params: { user_order: { product_id: @user_order.product_id, quantity: @user_order.quantity, user_id: @user_order.user_id, user_price_per_unit: @user_order.user_price_per_unit } }
    end

    assert_redirected_to user_order_url(UserOrder.last)
  end

  test "should show user_order" do
    get user_order_url(@user_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_order_url(@user_order)
    assert_response :success
  end

  test "should update user_order" do
    patch user_order_url(@user_order), params: { user_order: { product_id: @user_order.product_id, quantity: @user_order.quantity, user_id: @user_order.user_id, user_price_per_unit: @user_order.user_price_per_unit } }
    assert_redirected_to user_order_url(@user_order)
  end

  test "should destroy user_order" do
    assert_difference('UserOrder.count', -1) do
      delete user_order_url(@user_order)
    end

    assert_redirected_to user_orders_url
  end
end
