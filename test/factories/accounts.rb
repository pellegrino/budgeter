# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :account do |f|
  f.name "Credit Card"
  f.initial_balance "100,00" 
end
