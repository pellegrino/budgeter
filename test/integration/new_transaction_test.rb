require 'test_helper'

class NewTransactionTest < ActionDispatch::IntegrationTest
  setup do
    visit new_transaction_path 
  end
  test "create a transaction and displays it after" do
    Dom::Transaction.create :amount => 1000, :title => "foo" 
    transaction = Dom::Transaction.find_by_title "foo" 
    
    refute_nil transaction
  end 
end
