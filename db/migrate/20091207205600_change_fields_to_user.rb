class ChangeFieldsToUser < ActiveRecord::Migration
  def self.up
    change_column :users, :height, :integer, :precision => 3
    change_column :users, :meta, :decimal, :precision => 3, :scale => 1
  end

  def self.down
  end
end
