# Converts money from the persistence format into human readable format 
class MoneyConverter

  def from_cents_to_units(amount)
    amount.to_f / 100.0
  end 

  def from_units_to_cents(amount)
    (amount.to_f * 100.0).to_i
  end 

end 
