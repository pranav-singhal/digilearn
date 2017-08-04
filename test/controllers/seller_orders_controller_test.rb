require 'test_helper'

class SellerOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @seller_order = seller_orders(:one)
  end

  test "should get index" do
    get seller_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_seller_order_url
    assert_response :success
  end

  test "should create seller_order" do
    assert_difference('SellerOrder.count') do
      post seller_orders_url, params: { seller_order: { product_id: @seller_order.product_id, qunatity: @seller_order.qunatity, seller_id: @seller_order.seller_id, seller_price_per_unit: @seller_order.seller_price_per_unit } }
    end

    assert_redirected_to seller_order_url(SellerOrder.last)
  end

  test "should show seller_order" do
    get seller_order_url(@seller_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_seller_order_url(@seller_order)
    assert_response :success
  end

  test "should update seller_order" do
    patch seller_order_url(@seller_order), params: { seller_order: { product_id: @seller_order.product_id, qunatity: @seller_order.qunatity, seller_id: @seller_order.seller_id, seller_price_per_unit: @seller_order.seller_price_per_unit } }
    assert_redirected_to seller_order_url(@seller_order)
  end

  test "should destroy seller_order" do
    assert_difference('SellerOrder.count', -1) do
      delete seller_order_url(@seller_order)
    end

    assert_redirected_to seller_orders_url
  end
end
