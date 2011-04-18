require 'test_helper'

class AccountTransactionTest < ActionDispatch::IntegrationTest

  test "displays blank slate when there is no transaction for this account" do
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
    refute_empty Dom::Transaction.all
  end
end
