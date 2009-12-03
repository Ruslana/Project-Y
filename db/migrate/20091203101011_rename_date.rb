class RenameDate < ActiveRecord::Migration
  def self.up
    rename_column :posts, :date, :published_at
  end

  def self.down
    rename_column :posts, :published_at, :date
  end
end
