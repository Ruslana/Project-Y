class AddColumnToBand < ActiveRecord::Migration
  def self.up
    add_column :participants, :file_file_name, :string
    add_column :participants, :file_file_type, :string
    add_column :participants, :file_file_size, :integer
    add_column :participants, :file_updated_at, :datetime
  end

  def self.down
    remove_column :participants, :file_file_name
    remove_column :participants, :file_file_type
    remove_column :participants, :file_file_size
    remove_column :participants, :file_updated_at
  end
end
