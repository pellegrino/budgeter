$:.unshift File.join(File.dirname(__FILE__), "..", "lib")

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'factory_girl'
require 'test_benchmark' 

class ActiveSupport::TestCase
  Money.default_currency = Money::Currency.new("USD")
  # Add more helper methods to be used by all tests here...
end

class ActionController::TestCase
  include RR::Adapters::TestUnit
end

class ActionDispatch::IntegrationTest
  include Capybara
  #  require 'akephalos' 
  # Capybara.javascript_driver = :akephalos
  Capybara.app = Budgeter::Application
end

module Dom
  class Account < Domino
    selector '#accounts li'
    attribute :name, "#name"

    def self.create(params)
      within('form') do
        fill_in "account_name" , :with => params[:name]
        fill_in "account_initial_balance", :with => params[:initial_balance]

        click_button :account_submit
      end
    end
  end
  class Transaction < Domino
    selector '#transactions li'
    attribute :title, 'span#title'
    attribute :amount, "span#amount"
    attribute :account, "span#account"

    def self.create(params)
      within('form') do
        fill_in "transaction_title" , :with => params[:title]
        fill_in "transaction_amount", :with => params[:amount]
        page.select params[:account].name , :from => "transaction_account_id"

        click_button :transaction_submit
      end
    end

  end
end
