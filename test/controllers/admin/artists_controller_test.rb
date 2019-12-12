require 'test_helper'

class Admin::ArtistsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_artists_create_url
    assert_response :success
  end

  test "should get update" do
    get admin_artists_update_url
    assert_response :success
  end

  test "should get hide" do
    get admin_artists_hide_url
    assert_response :success
  end

end
