class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :name
      t.string :currency
      t.integer :cents

      t.timestamps
    end

    add_column :transactions , :account_id , :integer
    add_index :transactions, :account_id
    add_index :accounts, :name , :unique => true
  end

  def self.down
    remove_index :transactions, :account_id
    remove_index :accounts, :name
    remove_column :transactions , :account_id , :integer
    drop_table :accounts
  end
end
