require 'test_helper'

class DemoControllerControllerTest < ActionController::TestCase
  test "should get index_view1" do
    get :index_view1
    assert_response :success
  end

end
