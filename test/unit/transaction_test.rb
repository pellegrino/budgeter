require 'test_helper'

class TransactionTest < ActiveModel::TestCase
  setup do
    @transaction = Transaction.new
  end
  
  # TODO: rewrite this in a shoulda belongs_to like assert 
  test "associate to an account" do
    assert Transaction.reflect_on_association(:account)
    
    account = Factory(:account)
    transaction = Transaction.create(:account => account, :title => "foo") 
    assert_equal "Credit Card", Transaction.last.account.name 
  end
  
  test "records this transaction amount as a money" do
    @transaction.amount = 1000
    assert_equal @transaction.amount , Money.new(100000, 'USD')
  end
  
  test "denies storing invalid values" do
    assert_raises(ArgumentError) do 
      @transaction.amount = nil
    end
  end

  test "retrieve all transactions for an account name" do
    @wallet = Factory(:account, :name => "wallet")
    @other_account = Factory(:account) 
    Factory(:transaction, :account => @wallet)
    Factory(:transaction, :account => @other_account)
    Factory(:transaction, :account => @other_account)
    
    @transactions_for_wallet = Transaction.for_an_account_name("wallet")
    assert_equal 1, @transactions_for_wallet.size 
  end 
  

end
