require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get new" do
    get :home
    assert_response :success
  end

end
