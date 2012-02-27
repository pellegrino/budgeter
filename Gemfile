source 'https://rubygems.org'

gem 'rails', '3.2.1'
gem 'sass-rails',   '~> 3.2.3'
gem 'jquery-rails'

group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development  do
  gem 'sqlite3'
  gem 'heroku'
end 

group :development, :test do
  gem 'rspec-rails', '>= 2.8.1'
end 

group :test do
  gem "factory_girl_rails", ">= 1.6.0"
  gem "capybara", ">= 1.1.2"
  gem "database_cleaner"
  gem 'vcr'
  gem 'webmock'
end 

group :production do
  gem 'pg'
end 
