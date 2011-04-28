class AddingDateWhenHappenedATransaction < ActiveRecord::Migration
  def self.up
    add_column :transactions,  :occurred_date, :date
  end

  def self.down
    remove_column :transactions , :occurred_date
  end
end
