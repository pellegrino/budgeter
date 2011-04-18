require 'test_helper'

class NewTransactionTest < ActionDispatch::IntegrationTest
  setup do
    @account = Factory(:account)
    visit new_transaction_path

  end
  
  test "create a transaction and displays it after" do
    Dom::Transaction.create :title => "foo" , :amount => "12345,00" , :account => @account
    transaction = Dom::Transaction.find_by_title /foo/

    refute_nil transaction
    assert_equal "foo", transaction.title
    assert_equal "12345.00", transaction.amount
    assert_equal "Credit Card", transaction.account
    
  end

  test "cancels this transactions and go back to transactions listing" do
    click_link "Cancel"
    assert_empty Dom::Transaction.all
    assert_equal transactions_path , current_path
  end 
end

