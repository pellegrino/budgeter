require 'test_helper'

class TransactionTest < ActiveModel::TestCase
  setup do
    @transaction = Transaction.new
  end

  test "assigns the occurred date as today as a default" do
    assert_equal Date.today, @transaction.occurred_date

    transaction_with_different_occurred_date = Transaction.new :occurred_date => Date.yesterday

    assert_false Date.today.eql? transaction_with_different_occurred_date.occurred_date
  end


  test "tag transactions" do
    @transaction.tag_list = "shopping, groceries"
    @transaction.save!

    assert @transaction.tags.count == 2
  end
  # TODO: rewrite this in a shoulda belongs_to like assert
  test "associate to an account" do
    assert Transaction.reflect_on_association(:account)

    account = Factory(:account)
    transaction = Transaction.create(:account => account, :title => "foo")
    assert_equal "Credit Card", Transaction.last.account.name
  end

  test "records this transaction amount as a money" do
    @transaction.amount = 1000
    assert_equal @transaction.amount , Money.new(100000, 'USD')
  end

  test "denies storing invalid values" do
    assert_raises(ArgumentError) do
      @transaction.amount = nil
    end
  end

end
