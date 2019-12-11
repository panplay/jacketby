require 'test_helper'

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get homes_about_url
    assert_response :success
  end

  test "should get thanks" do
    get homes_thanks_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get homes_unsubscribe_url
    assert_response :success
  end

  test "should get index" do
    get homes_index_url
    assert_response :success
  end

end
