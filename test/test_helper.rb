ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'dominos' # used for integration tests 
require 'factory_girl'

class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Capybara
  Capybara.app = Budgeter::Application
end

module Dom
  class Transaction < Domino
    selector '#transactions li'
    attribute :title, 'p'

    def self.create(params)
      within('form') do
        fill_in :transction_title , :with => params[:title] 
        click_button :transaction_submit 
      end
    end 
    
  end 
end 
