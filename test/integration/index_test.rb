require 'test_helper'
require 'minitest/autorun'


class IndexTest < ActionDispatch::IntegrationTest
  setup do
    visit '/'
  end

  test 'welcome message' do
    assert page.has_content?('Welcome aboard')
    assert page.has_content?('Getting started')
  end

  test "getting started" do
    rails_generate = Dom::GettingStarted.find_by_title(/rails generate/)
    assert_not_nil rails_generate
    assert rails_generate.description =~ /run it without parameters/ 

    assert_not_nil Dom::GettingStarted.find_by_title(/Set up a default route/)
    assert_not_nil Dom::GettingStarted.find_by_title(/Create your database/)
  end

  test "sidebar links" do
    assert_equal(
      "http://api.rubyonrails.org/",
      Dom::SidebarLink.find_by_title("Rails API").href 
    )
    assert_equal(
      "http://stdlib.rubyonrails.org/",
      Dom::SidebarLink.find_by_title("Ruby standard library").href
    )
  end
end
