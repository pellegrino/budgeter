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
    remove_column :transactions , :account_id , :integer
    remove_index :transactions, :account_id
    drop_table :accounts

  end
end
