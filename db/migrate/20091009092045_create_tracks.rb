class CreateTracks < ActiveRecord::Migration
  def self.up
    create_table :tracks do |t|
      t.string :title_full_file
      t.string :title_cut_file
      t.string :price
      t.string :time
      t.integer :full_version_audio_id
      t.integer :preview_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tracks
  end
end
