require 'test_helper'

class AccountTest < ActiveSupport::TestCase

  setup do
    @account = Account.new
  end
  # TODO: Implement this test in a more shoulda way (should have_many...) 
  test "association with transactions" do
    assert Account.reflect_on_association :transactions
  end 
  test "records the initial balance" do
    @account.initial_balance = 10000
    assert_equal @account.initial_balance, Money.new(1000000 , "USD")
  end 
end
