class BoolingColumn < ActiveRecord::Migration
  def self.up
    add_column :orders, :complete, :boolean, :default => false
  end

  def self.down
    remove_column :orders, :complete
  end
end
