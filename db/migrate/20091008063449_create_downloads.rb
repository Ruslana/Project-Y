class CreateDownloads < ActiveRecord::Migration
  def self.up
    create_table :downloads do |t|
      t.string :title_whole_music
      t.string :title_cut_music

      t.timestamps
    end
  end

  def self.down
    drop_table :downloads
  end
end
