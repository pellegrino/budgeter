class Transaction < ActiveRecord::Base
  belongs_to :account

  def amount=(new_amount)
    write_attribute("amount", MoneyConverter.new.from_units_to_cents(new_amount))
  end

  def amount
    MoneyConverter.new.from_cents_to_units(read_attribute("amount"))
  end

  def account_name
    account.name if account
  end 

end
