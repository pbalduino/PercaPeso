class ChangeFieldsToProfile < ActiveRecord::Migration
  def self.up
    change_column :users, :meta, :decimal, :precision => 4, :scale => 1
  end

  def self.down
  end
end
