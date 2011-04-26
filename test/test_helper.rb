$:.unshift File.join(File.dirname(__FILE__), "..", "lib")

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'factory_girl'
require 'test_benchmark'

class ActiveSupport::TestCase
  include RR::Adapters::TestUnit
  Money.default_currency = Money::Currency.new("USD")
end

class ActionController::TestCase
  include RR::Adapters::TestUnit
end

class ActionDispatch::IntegrationTest
  include Capybara
  Capybara.app = Budgeter::Application
end

module Dom
  class Account < Domino
    selector '#menu #accounts li'

    def name
      node.text.strip
    end

    def self.create(params)
      visit '/accounts/new' unless current_url == '/accounts/new'

      within('form') do
        fill_in "account_name" , :with => params[:name]
        fill_in "account_initial_balance", :with => params[:initial_balance]

        click_button :account_submit
      end
    end
  end
  class Transaction < Domino
    selector '#transactions tbody tr'
    attribute :title
    attribute :amount
    attribute :account
    attribute :tags

    def self.create(params)
      within('form') do
        fill_in "transaction_title" , :with => params[:title]
        fill_in "transaction_amount", :with => params[:amount]
        fill_in 'transaction_tag_list' , :with => params[:tags].join(',')
        page.select params[:account].name , :from => "transaction_account_id"

        click_button :transaction_submit
      end
    end

  end
end
