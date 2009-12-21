class ChangeFieldsToWeight < ActiveRecord::Migration
  def self.up
    change_column :weights, :date, :datetime, :null => false
  end

  def self.down
  end
end
