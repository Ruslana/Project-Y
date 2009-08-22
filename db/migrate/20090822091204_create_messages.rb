class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :your_name
      t.string :your_email
      t.string :your_message

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
