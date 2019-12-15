require 'test_helper'

class Customer::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get customer_customers_edit_url
    assert_response :success
  end

  test "should get favorites" do
    get customer_customers_favorites_url
    assert_response :success
  end

end
