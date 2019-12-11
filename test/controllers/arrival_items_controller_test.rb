require 'test_helper'

class ArrivalItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get arrival_items_index_url
    assert_response :success
  end

  test "should get new" do
    get arrival_items_new_url
    assert_response :success
  end

  test "should get create" do
    get arrival_items_create_url
    assert_response :success
  end

end
