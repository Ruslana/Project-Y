class JoinTable < ActiveRecord::Migration
  def self.up
    create_table :albums_uploads, :id => false do |t|
      t.integer :album_id
      t.integer :upload_id
    end
  end

  def self.down
    drop_table :albums_uploads
  end
end
