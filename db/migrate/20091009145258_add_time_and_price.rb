class AddTimeAndPrice < ActiveRecord::Migration
  def self.up
    add_column :uploads, :time, :string
    add_column :uploads, :price, :string
  end

  def self.down
    remove_column :uploads, :time
    remove_column :uploads, :price
  end
end
