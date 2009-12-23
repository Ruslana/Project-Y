class RenameTable < ActiveRecord::Migration
  def self.up
    rename_table :uploadeds_files, :uploaded_files
  end

  def self.down
    rename_table :uploaded_files, :uploadeds_files
  end
end
