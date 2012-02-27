class Transaction < ActiveRecord::Base

  def amount=(new_amount)
    write_attribute("amount", MoneyConverter.new.from_units_to_cents(new_amount))
  end

  def amount
    MoneyConverter.new.from_cents_to_units(read_attribute("amount"))
  end

end
