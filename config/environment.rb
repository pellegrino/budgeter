# Load the rails application
require File.expand_path('../application', __FILE__)
Money.default_currency = Money::Currency.new("USD")
# Initialize the rails application
Budgeter::Application.initialize!


