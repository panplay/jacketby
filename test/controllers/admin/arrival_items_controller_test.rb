require 'test_helper'

class Admin::ArrivalItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_arrival_items_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_arrival_items_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_arrival_items_create_url
    assert_response :success
  end

end
