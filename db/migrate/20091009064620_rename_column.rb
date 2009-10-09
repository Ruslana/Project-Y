class RenameColumn < ActiveRecord::Migration
  def self.up
    rename_column :uploads, :file_size_name, :file_file_size
  end

  def self.down
    rename_column :uploads, :file_file_size, :file_size_name
  end
end
