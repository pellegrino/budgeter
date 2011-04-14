ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'dominos'
require 'factory_girl' 
class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Capybara
  Capybara.app = Budgeter::Application
end
