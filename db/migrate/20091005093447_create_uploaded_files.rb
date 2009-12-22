class CreateUploadedFiles < ActiveRecord::Migration
  def self.up
    create_table :uploadeds_files do |t|
      t.string :music_file_name
      t.integer :music_file_size
      t.string :music_content_type
      t.datetime :music_updated_at
      t.integer :track_id

      t.timestamps
    end
  end

  def self.down
    drop_table :uploads
  end
end
