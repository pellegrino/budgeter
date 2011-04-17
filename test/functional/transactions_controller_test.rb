require 'test_helper'

class TransactionsControllerTest < ActionController::TestCase
  
  test "should get index" do
    get :index
    assert_response :success
  end

  test "prepare a transaction to be created" do
    get :new
    assert_response :success
    refute_nil assigns[:transaction]
  end 
end
