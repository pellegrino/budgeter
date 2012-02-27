require_relative "../../app/domain/transaction_holder"

# Creating this class at the test so it not loads active record in tests 
class Transaction ; end 

describe TransactionHolder do

  describe "#create_transaction" do

    let(:params) { { 'foo' => 'bar' } }

    it "creates a transaction with given params"  do
      Transaction.should_receive(:create).with(params)
      TransactionHolder.create_transaction(params)
    end 

    it "returns the newly created transaction" do
      Transaction.stub!(:create).with(params) { '42' } 
      TransactionHolder.create_transaction(params).should == '42'
    end 

  end 

  describe "#all" do

    it "list every transaction"  do
      all_transactions = %q{ foo bar baz }
      Transaction.stub(:all) { all_transactions  }
      TransactionHolder.all.should == all_transactions
    end 
  end 

  describe "#delete_transaction" do
    let(:transaction) { Transaction.new } 
    it "destroys given transaction" do
      Transaction.stub(:find).with('42') { transaction } 
      transaction.stub(:destroy).and_return('true')
      TransactionHolder.delete_transaction(:id => '42').should == 'true'
    end 
  end 
end 
