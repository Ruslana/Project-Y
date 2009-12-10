class RenameUpload < ActiveRecord::Migration
  def self.up
    rename_table :uploads, :uploaded_files
  end

  def self.down
    rename_table :uploaded_files, :uploads
  end
end
