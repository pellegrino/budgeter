require 'test_helper'

class TransactionsControllerTest < ActionController::TestCase

  setup do
    @transactions  = [ Transaction.new(:title => 'foo', :account =>
                                       Account.new(:name => "BAR")) ]


    @accounts = [ Account.new( :name => "foo") ]
    @account = Account.new

    stub(@account).transactions { @transactions }
    stub(Account).find_by_name('foo') { @account }
  end
  test "gets all accounts at index page" do
    mock(Account).all { @accounts  }
    get :index
    assert_equal @accounts, assigns[:accounts]
  end


  test "gets all accounts at account page" do
    mock(Account).all { @accounts }
    get :account , :name => "foo"
    assert_equal @accounts, assigns[:accounts]
  end
  test "gets every transaction given an account name" do
    mock(@account).transactions { @transactions }
    mock(Account).find_by_name('foo') { @account }

    get :account, :name => "foo"
    assert_equal @transactions, assigns[:transactions]
  end

  test "redirect to root_path on error" do
    stub(Account).find_by_name('bar') { nil }
    get :account, :name => 'bar'
    assert_redirected_to root_path
    assert_equal I18n.t("transaction.account.not_found") , flash[:alert]
  end
end
