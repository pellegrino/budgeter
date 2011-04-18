ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'dominos' # used for integration tests 
require 'factory_girl'

class ActiveSupport::TestCase
  Money.default_currency = Money::Currency.new("USD")
  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Capybara
  Capybara.app = Budgeter::Application
end

module Dom
  class Account < Domino
    selector '#accounts li'
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
