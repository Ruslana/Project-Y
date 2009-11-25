class SecretHash < ActiveRecord::Migration
  def self.up
    add_column :orders, :secret_hash, :string
  end

  def self.down
    add_column :orders, :secret_hash
  end
end
