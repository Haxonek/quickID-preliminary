require 'test_helper'

class AboutControllerTest < ActionController::TestCase
  test "should get us" do
    get :us
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
