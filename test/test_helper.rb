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

module Dom
  
end 

# module Dom
#   class Transaction < Domino
#     selector '#transactions li'
#     attribute :description, 'p' 
#   end
#   class GettingStarted < Domino
#     selector '#getting-started ol li'
#     attribute :title, 'h2'
#     attribute :description , 'p'
#   end

#   class SidebarLink < Domino
#     selector '#sidebar-items ul.links li'
#     attribute :title, 'a'

#     def href
#       node.find('a')['href']
#     end
#   end
# end
