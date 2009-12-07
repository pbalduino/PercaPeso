class AddFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :height, :integer, :limit => 3
    add_column :users, :meta, :decimal, :limit => 6, :precision => 1
    add_column :users, :date, :date
  end

  def self.down
    remove_column :users, :date
    remove_column :users, :meta
    remove_column :users, :height
  end
end
