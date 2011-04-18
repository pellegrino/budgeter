require 'test_helper'

class TransactionsControllerTest < ActionController::TestCase

  test "gets every transaction given an account name" do
    @transactions  = [ Transaction.new(:title => 'foo') ]
    mock(Transaction).for_an_account_name('foo') { @transactions }
    get :account, :name => "foo"
    assert_equal @transactions, assigns[:transactions]
  end
end
