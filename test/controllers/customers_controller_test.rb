require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get customers_show_url
    assert_response :success
  end

  test "should get hide" do
    get customers_hide_url
    assert_response :success
  end

  test "should get favorites" do
    get customers_favorites_url
    assert_response :success
  end

  test "should get index" do
    get customers_index_url
    assert_response :success
  end

  test "should get update" do
    get customers_update_url
    assert_response :success
  end

end
