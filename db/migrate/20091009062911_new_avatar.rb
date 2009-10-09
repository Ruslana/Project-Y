class NewAvatar < ActiveRecord::Migration
  def self.up
    add_column :uploads, :file_file_name, :string
    add_column :uploads, :file_size_name, :integer
    add_column :uploads, :file_updated_at, :datetime
    add_column :uploads, :file_content_type, :string 
  end

  def self.down
    remove_column :uploads, :file_file_name
    remove_column :uploads, :file_size_name
    remove_column :uploads, :file_updated_at
    remove_column :uploads, :file_content_type
  end
end
