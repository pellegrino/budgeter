require 'test_helper'

class NewTransactionTest < ActionDispatch::IntegrationTest
  setup do
    visit new_transaction_path 
  end
  
  test "create a transaction and displays it after" do
    Dom::Transaction.create :title => "foo" , :amount => "12345,00" 
    transaction = Dom::Transaction.find_by_title /foo/
    
    refute_nil transaction
    assert_equal "foo", transaction.title
    assert_equal "12345.00", transaction.amount 
  end 
end
