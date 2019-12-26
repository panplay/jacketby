require 'test_helper'

class Customers::RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get customers_rooms_show_url
    assert_response :success
  end

end
