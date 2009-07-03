class AddColumnAlbumId < ActiveRecord::Migration
  def self.up
    add_column :lyrics, :album_id, :integer
  end

  def self.down
    remove_column :lyrics, :album_id
  end
end
