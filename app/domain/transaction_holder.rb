class TransactionHolder

  def self.create_transaction(params)
    Transaction.create params
  end 

  def self.all
    Transaction.all
  end 

  def self.delete_transaction(params)
    transaction = Transaction.find params[:id]
    transaction.destroy
  end 

end 
