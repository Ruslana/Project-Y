class CreateUploads < ActiveRecord::Migration
  def self.up
    create_table :uploads do |t|
      t.string :name
      t.integer :size, :limit => 11
      t.string :file_name

      t.timestamps
    end
  end

  def self.down
    drop_table :uploads
  end
end
