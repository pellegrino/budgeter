class Account < ActiveRecord::Base
  has_many :transactions
  validates_uniqueness_of :name, :case_sensitive => false

  composed_of :initial_balance,
  :class_name => "Money",
  :mapping => [%w(cents cents), %w(currency currency_as_string)],
  :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) },
  :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, I18n.t("money.conversion.error", :value => value.class)) }




  def balance
    return self.initial_balance unless self.transactions.present?


    balance = self.initial_balance
    self.transactions.each { |transaction| balance -= transaction.amount }

    balance
  end
end
