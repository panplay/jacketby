require 'test_helper'

class ArtistsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get artists_create_url
    assert_response :success
  end

  test "should get update" do
    get artists_update_url
    assert_response :success
  end

  test "should get hide" do
    get artists_hide_url
    assert_response :success
  end

end
