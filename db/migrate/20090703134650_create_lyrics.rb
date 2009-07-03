class CreateLyrics < ActiveRecord::Migration
  def self.up
    create_table :lyrics do |t|
      t.string :title
      t.text :text_song

      t.timestamps
    end
  end

  def self.down
    drop_table :lyrics
  end
end
