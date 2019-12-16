require 'test_helper'

class Admin::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_items_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_items_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_items_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_items_update_url
    assert_response :success
  end

  test "should get hide" do
    get admin_items_hide_url
    assert_response :success
  end

end
