$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end
end
