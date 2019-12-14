require 'test_helper'

class Customer::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get customer_homes_about_url
    assert_response :success
  end

  test "should get thanks" do
    get customer_homes_thanks_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get customer_homes_unsubscribe_url
    assert_response :success
  end

end
