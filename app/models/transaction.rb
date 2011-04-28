class Transaction < ActiveRecord::Base
  after_initialize :set_occurred_date_as_today

  acts_as_taggable
  belongs_to :account

  composed_of :amount,
  :class_name => "Money",
  :mapping => [%w(cents cents), %w(currency currency_as_string)],
  :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) },
  :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, I18n.t("money.conversion.error", :value => value.class)) }


  protected
  def set_occurred_date_as_today
    self.occurred_date ||= Date.today
  end
end
