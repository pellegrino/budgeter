require 'test_helper'

class IndexTest < ActionDispatch::IntegrationTest

  test "displays a blankslate message only when there isn't accounts" do
    visit transactions_path
    assert_empty Dom::Account.all
    assert page.has_content? I18n.t("transactions.index.no_account")
    
    visit new_account_path 
    Dom::Account.create :name => "Credit Card" , :initial_balance => "100,00" 
    
    visit transactions_path
    refute page.has_content? I18n.t("transactions.index.no_account")
    assert_equal "Credit Card", Dom::Account.all.first.name 
  end

  
  test "shows a transaction input form" do
    visit transactions_path 
    
    assert page.has_content? I18n.t("transactions.new.href") 
    assert page.has_css?("a[href='#{new_transaction_path}']") 
  end
  
  test "list all transactions already recorded" do
    Factory(:transaction, :title => "fubar1" , :amount => 1000.00)
    Factory(:transaction, :title => "fubar2", :amount => 200.00)

    visit transactions_path
    # there should be 2 transactions listed
    transactions = Dom::Transaction.all
    assert_equal 2, transactions.size

    transaction1 = transactions.first
    assert_equal "fubar1", transaction1.title
    assert_equal "1000,00", transaction1.amount
    
    transaction2 = transactions.last
    assert_equal "fubar2", transaction2.title
    assert_equal "200,00", transaction2.amount
  end 
end
