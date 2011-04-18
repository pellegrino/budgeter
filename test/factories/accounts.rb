# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :account do |f|
  f.name "MyString"
  f.initial_balance 1
end