require 'test_helper'

class Customer::CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get customer_carts_show_url
    assert_response :success
  end

  test "should get create" do
    get customer_carts_create_url
    assert_response :success
  end

  test "should get update" do
    get customer_carts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get customer_carts_destroy_url
    assert_response :success
  end

end
