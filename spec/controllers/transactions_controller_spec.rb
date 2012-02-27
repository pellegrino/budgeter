require 'spec_helper'

describe TransactionsController do

  describe "GET 'index'" do
    it "assigns a new instance of transaction to be created" do
      get :index
      assigns[:transaction].should be_a_new(Transaction)
    end 

    it "fetches every transaction to be displayed" do
      all_transactions = %q{ foo bar } 
      TransactionHolder.stub(:all) { all_transactions } 
      get :index
      assigns[:transactions].should be_eql(all_transactions)
    end 
  end


  describe "POST 'create'" do
    let(:params) { { "foo" => "bar" } }

    it "creates a new transaction and redirects to index page" do
      TransactionHolder.stub!(:create_transaction).with(params) { true } 
      post :create, transaction: params
      response.should redirect_to(transactions_path) 
    end 


    it "assigns the newly created transaction" do
      TransactionHolder.stub!(:create_transaction).with(params) { '42' } 
      post :create, transaction: params

      assigns[:transaction].should be == '42'
    end 

    it "sets the flash message" do
      TransactionHolder.stub!(:create_transaction).with(params) { '42' } 
      post :create, transaction: params
      should set_the_flash
    end  

  end 

end
