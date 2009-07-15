class EditParticipant < ActiveRecord::Migration
  def self.up   
    add_column :participants, :avatar_file_size, :integer
    add_column :participants, :avatar_updated_at, :datetime
    add_column :participants, :title, :string
    remove_column :participants, :title_photo_small
    remove_column :participants, :title_photo_big
    rename_column :participants, :file_file_name, :avatar_file_name
    rename_column :participants, :file_content_type, :avatar_content_type
  end

  def self.down
    remove_column :participants, :avatar_file_size
    remove_column :participants, :avatar_updated_at
    remove_column :participants, :title
    add_column :participants, :title_photo_small, :string
    add_column :participants, :title_photo_big, :string
    rename_column :participants, :avatar_file_name, :file_file_name 
    rename_column :participants, :avatar_content_type, :file_content_type
  end
end
