require 'test_helper'

class NewAccountTest < ActionDispatch::IntegrationTest

  setup do
    visit new_account_path
  end

  test "shows the new account input form" do
    page.has_css?('h1', :text => I18n.t("accounts.new.title"), :visible => true)
  end

  test 'cancel link' do
    click_link 'Cancel'
    assert_equal accounts_path , current_path
    assert_empty Dom::Account.all
  end

  test "shows the sidebar with all accounts plus the option for displaying all" do
    Factory(:account, :name => "foo")

    visit new_account_path
    assert_equal 2, Dom::Account.count
  end
end
