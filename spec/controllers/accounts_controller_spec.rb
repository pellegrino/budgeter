require 'spec_helper'

describe AccountsController do


  describe "POST 'create'" do
    let(:valid_attributes) { { "name" => "Foo", "starting_balance" => '1'  } }

    it "creates a new account" do
      expect { 
        post :create, :account => valid_attributes  
      }.to change(Account, :count).by(1)
    end 

    it "sets the flash" do
      post :create, :account => valid_attributes  
      should set_the_flash
    end 

    it "redirects to its details page" do
      post :create, :account => valid_attributes  
      response.should redirect_to account_path(Account.last)
    end 

    it "assigns the newly created account to :account" do
      Account.stub(:create).with(valid_attributes) { 'foo' }
      post :create, :account => valid_attributes
      assigns[:account].should == 'foo'
    end 
  end 


 describe "GET 'show'" do

   it "fetches the requested account"  do
     Account.stub(:find).with('42') { 'foo' } 
     get :show , :id => '42'
     assigns[:account].should == 'foo'
   end 

 end 

end 
