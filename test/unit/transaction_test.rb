require 'test_helper'

class TransactionTest < ActiveModel::TestCase
  setup do
    @transaction = Transaction.new
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
  
  # TODO: rewrite this in a shoulda belongs_to like assert 
  test "associate to an account" do
    assert Transaction.reflect_on_association(:account)
    
    account = Factory(:account)
    transaction = Transaction.create(:account => account, :title => "foo") 
    assert_equal "Credit Card", Transaction.last.account.name 
  end
end
