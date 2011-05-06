require 'test_helper'

class NewTransactionTest < ActionDispatch::IntegrationTest
  setup do
    @account = Factory(:account)
    visit new_transaction_path

  end

  test "create a transaction and displays it after" do
    Dom::Transaction.create :title => "foo" , :amount => "12345,00" ,  :account => @account.name, :tags => ['foo' , 'bar']
    transaction = Dom::Transaction.find_by_title /foo/

    assert_not_nil transaction
    assert_equal "foo", transaction.title
    assert_equal "$12,345.00", transaction.amount
    assert_equal "Credit Card", transaction.account
    assert_equal "foo, bar", transaction.tags
  end

  test "cancels this transactions and go back to transactions listing" do
    click_link "Cancel"
    assert_empty Dom::Transaction.all
    assert_equal transactions_path , current_path
  end
end

