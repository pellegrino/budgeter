class AddingDateWhenHappenedATransaction < ActiveRecord::Migration
  def self.up
    rename_column :transactions,  :date_ocurred, :occurred_date
  end

  def self.down
    rename_column :transactions , :occurred_date, :date_ocurred
  end
end
