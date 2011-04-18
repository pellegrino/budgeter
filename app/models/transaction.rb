class Transaction < ActiveRecord::Base
  belongs_to :account
  
  composed_of :amount,
  :class_name => "Money",
  :mapping => [%w(cents cents), %w(currency currency_as_string)],
  :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) },
  :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, I18n.t("money.conversion.error", :value => value.class)) }
end
