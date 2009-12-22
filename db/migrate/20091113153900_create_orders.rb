class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :amount
      t.string :email
      t.string :secret_hash
      t.boolean :complete, :default => false
      t.boolean :gateway_error, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
