class AccountsHaveManyTransactionsAndTransactionsBelongsToAccounts < ActiveRecord::Migration
  def change
    add_column :transactions , :account_id , :integer
    add_index  :transactions,  :account_id
  end 
end
