require 'test_helper'

class IndexTest < ActionDispatch::IntegrationTest
  setup do
    visit transactions_path 
  end
  test "shows a transaction input form" do
    assert page.has_content?("New transaction")
    assert page.has_css?("a[href='#{new_transaction_path}']") 
  end 
end
