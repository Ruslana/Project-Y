class RenameAlbumId < ActiveRecord::Migration
  def self.up
    rename_column :lyrics, :album_id, :track_id
  end

  def self.down
    rename_column :lyrics, :track_id, :album_id
  end
end
