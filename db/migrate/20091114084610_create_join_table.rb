class CreateJoinTable < ActiveRecord::Migration
  def self.up
    create_table :orders_tracks, :id => false do |t|
      t.integer :order_id
      t.integer :track_id
    end
  end

  def self.down
    drop_table :orders_tracks
  end
end
