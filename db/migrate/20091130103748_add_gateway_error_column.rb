class AddGatewayErrorColumn < ActiveRecord::Migration
  def self.up
    add_column :orders, :gateway_error, :boolean, :default => false
  end

  def self.down
    remove_column :orders, :gateway_error
  end
end
