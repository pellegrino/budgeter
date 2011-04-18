# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :transaction do |f|
  f.title "Fubar spending"
  f.amount "100,00" 
  f.currency "BRL" 
  f.date_ocurred "2011-04-15"
end
