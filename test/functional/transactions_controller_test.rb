require 'test_helper'

class TransactionsControllerTest < ActionController::TestCase

  setup do
    account = Factory(:account, :name => "foo", :initial_balance => "10.0")
    Factory(:transaction , :title => 't1', :account => account, :amount => '1.0')
    Factory(:transaction , :title => 't2', :account => account, :amount => '2.0')
  end
  test "gets all accounts at index page" do
    get :index
    assert_not_nil assigns[:accounts]
  end

  test "gets all accounts at account page" do
    get :account , :name => 'foo'
    assert_not_nil assigns[:accounts]
  end

  test "gets every transaction given an account name" do
    get :account , :name => 'foo'
    assert_not_nil assigns[:transactions]
    assert_equal 2, assigns[:transactions].size
  end

  test "redirect to root_path on error" do
    get :account , :name => 'bar'
    assert_redirected_to root_path
    assert_not_nil flash[:alert]
  end
end
