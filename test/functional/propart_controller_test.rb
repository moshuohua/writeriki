require 'test_helper'

class PropartControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
