class TransactionHolder

  def self.create_transaction(params)
    Transaction.create params
  end 

  def self.all
    Transaction.all
  end 

end 
