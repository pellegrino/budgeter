require 'test_helper'

class AccountTest < ActiveSupport::TestCase

  setup do
    @account = Account.new
  end 
  
  test "records the initial balance" do
    @account.initial_balance = 10000
    assert_equal @account.initial_balance, Money.new(1000000 , "USD")
  end 
end
