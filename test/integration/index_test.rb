require 'test_helper'

class IndexTest < ActionDispatch::IntegrationTest

  test 'show every available account plus "list all option" at the navigation bar'  do
    Factory(:account, :name => "wallet", :initial_balance => "100,00")
    Factory(:account, :name => "bank", :initial_balance => "10000,00")

    visit root_path
    accounts = Dom::Account.all
    assert_equal 3,  accounts.count
    assert_equal "All", accounts.first.name
    assert_equal "bank" , accounts.last.name
  end

  test 'provide links to the transactions of an account' do
    Factory(:account, :name => "wallet")
    visit root_path

    page.click_link("wallet")
    assert current_url == account_transactions_url("wallet")
  end

  test "displays a blankslate message only when there isn't accounts" do
    visit transactions_path
    assert_empty Dom::Account.all
    assert page.has_content? I18n.t("transactions.index.no_account")

    Dom::Account.create :name => "Credit Card" , :initial_balance => "100,00"

    visit transactions_path
    assert_false page.has_content? I18n.t("transactions.index.no_account")
  end

  test "shows a transaction input form" do
    visit transactions_path

    assert page.has_content? I18n.t("transactions.new.href")
    assert page.has_css?("a[href='#{new_transaction_path}']")
  end

  test "shows all transactions already recorded" do
    Factory(:transaction, :title => "fubar1" , :amount => 1000.00)
    Factory(:transaction, :title => "fubar2", :amount => 200.00)
    visit transactions_path

    transactions = Dom::Transaction.all
    assert_equal 2, transactions.size

    transaction1 = transactions.first
    assert_equal "fubar1", transaction1.title
    assert_equal "$1,000.00", transaction1.amount

    transaction2 = transactions.last
    assert_equal "fubar2", transaction2.title
    assert_equal "$200.00", transaction2.amount
  end
end
