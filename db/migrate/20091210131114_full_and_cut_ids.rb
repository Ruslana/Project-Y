class FullAndCutIds < ActiveRecord::Migration
  def self.up
    add_column :tracks, :full_version_audio_id, :integer
    add_column :tracks, :preview_id, :integer
  end

  def self.down
    remove_column :tracks, :preview_id
    remove_column :tracks, :full_version_audio_id
  end
end
