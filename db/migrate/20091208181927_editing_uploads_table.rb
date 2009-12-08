class EditingUploadsTable < ActiveRecord::Migration
  def self.up
    remove_column :uploads, :name
    remove_column :uploads, :title
    remove_column :uploads, :price
    remove_column :uploads, :time
    remove_column :uploads, :file_file_name
    remove_column :uploads, :file_file_size
    remove_column :uploads, :file_content_type
    remove_column :uploads, :file_updated_at
    add_column :uploads, :track_id, :integer
  end

  def self.down
    remove_column :uploads, :track_id
    add_column :uploads, :file_updated_at, :datetime
    add_column :uploads, :file_content_type, :string
    add_column :uploads, :file_file_size, :integer
    add_column :uploads, :file_file_name, :string
    add_column :uploads, :time, :string
    add_column :uploads, :price, :string
    add_column :uploads, :title, :string
    add_column :uploads, :name, :string
  end
end
