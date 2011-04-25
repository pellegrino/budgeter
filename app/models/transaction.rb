class Transaction < ActiveRecord::Base
  acts_as_taggable
  belongs_to :account

  composed_of :amount,
  :class_name => "Money",
  :mapping => [%w(cents cents), %w(currency currency_as_string)],
  :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) },
  :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, I18n.t("money.conversion.error", :value => value.class)) }


  def self.for_an_account_name(account_name)
    all.select do |t|
      t.account.name == account_name
    end
  end
end
