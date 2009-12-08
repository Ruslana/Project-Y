class RenameJoinTables < ActiveRecord::Migration
  def self.up
    rename_table :orders_uploads, :orders_tracks
    rename_table :albums_uploads, :albums_tracks
    rename_column :orders_tracks, :upload_id, :track_id
    rename_column :albums_tracks, :upload_id, :track_id
  end

  def self.down
    rename_table :orders_tracks, :orders_uploads
    rename_table :albums_tracks, :albums_uploads
    rename_column :orders_uploads, :track_id, :upload_id
    rename_column :albums_uploads, :track_id, :upload_id
  end
end
