class AddFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :height, :integer, :precision => 3
    add_column :users, :meta, :decimal, :precision => 3, :scale => 1
    add_column :users, :date, :date
  end

  def self.down
    remove_column :users, :date
    remove_column :users, :meta
    remove_column :users, :height
  end
end
