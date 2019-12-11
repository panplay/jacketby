require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get categories_create_url
    assert_response :success
  end

  test "should get update" do
    get categories_update_url
    assert_response :success
  end

  test "should get hide" do
    get categories_hide_url
    assert_response :success
  end

end
