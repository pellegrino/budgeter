# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :transaction do |f|
  f.title "MyString"
  f.cents 1
  f.currency "MyString"
  f.date_ocurred "2011-04-15"
end