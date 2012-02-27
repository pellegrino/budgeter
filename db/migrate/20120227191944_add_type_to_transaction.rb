class AddTypeToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :transaction_type, :string
    add_index  :transactions, :transaction_type 
  end
end
