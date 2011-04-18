require 'test_helper'

class IndexTest < ActionDispatch::IntegrationTest
  test "shows a transaction input form" do
    visit transactions_path 
    assert page.has_content?("New transaction")
    assert page.has_css?("a[href='#{new_transaction_path}']") 
  end
  
  test "list all transactions already recorded" do
    Factory(:transaction, :title => "fubar1" )
    Factory(:transaction, :title => "fubar2"  )

    visit transactions_path

    # there should be 2 transactions listed
    transactions = Dom::Transaction.all
    
    assert_equal 2, transactions.size
    assert_equal "fubar1", transactions.first.title
    assert_equal "fubar2", transactions.last.title
    
    
  end 
end
