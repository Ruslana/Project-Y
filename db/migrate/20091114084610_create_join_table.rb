class CreateJoinTable < ActiveRecord::Migration
  def self.up
    create_table :orders_uploads, :id => false do |t|
      t.integer :order_id
      t.integer :upload_id
    end
  end

  def self.down
    drop_table :orders_uploads
  end
end
