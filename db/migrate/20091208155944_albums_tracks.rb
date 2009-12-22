class AlbumsTracks < ActiveRecord::Migration
  def self.up
    create_table :albums_tracks, :id => false do |t|
      t.integer :album_id
      t.integer :track_id
    end
  end

  def self.down
    drop_table :albums_tracks
  end
end
