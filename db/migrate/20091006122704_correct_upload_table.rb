class CorrectUploadTable < ActiveRecord::Migration
  def self.up
    rename_column :uploads, :file_name, :music_file_name
    rename_column :uploads, :size, :music_file_size
    add_column :uploads, :music_content_type, :string
    add_column :uploads, :music_updated_at,   :datetime 
  end

  def self.down
    rename_column :uploads, :music_file_name, :file_name
    rename_column :uploads, :music_file_size, :size
    remove_column :uploads, :music_content_type
    remove_column :uploads, :music_updated_at 
  end
end
