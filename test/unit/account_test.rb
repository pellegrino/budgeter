require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  setup do
    @account = Account.new :initial_balance => 5
  end

  test "an account name should be unique" do
    @first_account = Factory(:account, :name => "wallet")
    assert_raises(ActiveRecord::RecordInvalid) do
      @second_account = Factory(:account, :name => "wallet")
    end
    assert_equal 1, Account.count
  end
  test "uniqueness case insensitivity" do
    @first_account = Factory(:account, :name => "wallet")
    assert_raises(ActiveRecord::RecordInvalid) do
      @second_account = Factory(:account, :name => "WalLet")
    end
    assert_equal 1 , Account.count
  end

  # TODO: Implement this test in a more shoulda way (should have_many...)
  test "association with transactions" do
    assert Account.reflect_on_association :transactions
  end
  test "records the initial balance" do
    @account.initial_balance = 10000
    assert_equal @account.initial_balance, Money.new(1000000 , "USD")
  end

  test "keeps track of the balance given the transactions" do
    assert_equal @account.balance, @account.initial_balance

    @account.transactions << Transaction.new(:title => "t1", :amount => 1)
    assert_equal Money.new(400), @account.balance

    @account.transactions << Transaction.new(:title => "t1", :amount => 3)
    assert_equal Money.new(100), @account.balance
  end
end
