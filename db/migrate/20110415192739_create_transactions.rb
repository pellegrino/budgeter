class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.string :title
      t.integer :cents
      t.string :currency
      t.date :date_ocurred

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
