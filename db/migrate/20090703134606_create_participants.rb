class CreateParticipants < ActiveRecord::Migration
  def self.up
    create_table :participants do |t|
      t.string :name
      t.text :bio
      t.string :title_photo_small
      t.string :title_photo_big

      t.timestamps
    end
  end

  def self.down
    drop_table :participants
  end
end
