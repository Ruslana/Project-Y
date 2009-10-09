class ColumnTitle < ActiveRecord::Migration
  def self.up
    add_column :uploads, :title, :string
  end

  def self.down
    remove_column :uploads, :title
  end
end
