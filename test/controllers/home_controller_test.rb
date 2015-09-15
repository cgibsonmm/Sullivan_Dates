require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test "should get welcome" do
    get :welcome
    assert :success
  end

end
