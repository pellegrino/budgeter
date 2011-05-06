# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :transaction do |f|
  f.title "Fubar spending"
  f.amount "100,00"
  f.currency "USD"
  f.occurred_date nil
end
