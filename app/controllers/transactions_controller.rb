class TransactionsController < ApplicationController

  def index
    @transaction  = Transaction.new 
    @transactions = TransactionHolder.all
  end

  def create
    @transaction = TransactionHolder.create_transaction(params[:transaction])
    redirect_to  transactions_path, notice: "Transaction created successfully"
  end 
end
