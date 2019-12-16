require 'test_helper'

class Customer::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customer_orders_new_url
    assert_response :success
  end

  test "should get create" do
    get customer_orders_create_url
    assert_response :success
  end

end
