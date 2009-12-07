class CreateWeights < ActiveRecord::Migration
  def self.up
    create_table :weights do |t|
      t.integer :user_id
      t.datetime :date
      t.decimal :weight, :limit => 6, :precision => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :weights
  end
end
