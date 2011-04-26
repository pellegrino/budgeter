require 'test_helper'

class AccountTransactionTest < ActionDispatch::IntegrationTest

  test "displays blank slate when there is no transaction for this account" do
    Dom::Account.create :name => "foo"

    visit account_transactions_path("foo")
    assert_empty Dom::Transaction.all
    assert page.has_content? I18n.t("transactions.account.no_transaction")
  end


  test "shows every transaction for this account" do
    @account = Factory(:account, :name => "foo")
    @transaction1 = Factory(:transaction, :account => @account, :title => "t1")
    @transaction2 = Factory(:transaction, :account => @account , :title => 't2')

    @other_account = Factory(:account, :name => "bar")
    @transaction3 = Factory(:transaction , :account => @other_account, :title => "t3")

    visit account_transactions_path("foo")

    transactions = Dom::Transaction.all
    assert_equal 2, transactions.count
    assert_equal "t1" , transactions.first.title
    assert_equal "foo" , transactions.first.account

    assert_equal "t2" , transactions.last.title
    assert_equal "foo" , transactions.last.account
  end

  test 'shows the create form with the account already selected' do
    @account = Factory(:account, :name => "foo")
    visit account_transactions_path("foo")

    page.click_link I18n.t("transactions.new.href")
    assert page.has_xpath?("//option[@selected = 'selected' and contains(string(), foo)]")
  end
end
