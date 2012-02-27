class AccountsController < ApplicationController
  def new
    @account     = Account.new
    @transaction = Transaction.new
  end 

  def create
    @account = Account.create(params[:account])
    if @account 
      redirect_to(account_path(@account), :notice => "Account created successfully")
    end 
  end 

  def show
    @account     = Account.find params[:id]
    @transaction = Transaction.new(:account => @account)
  end 
end 
