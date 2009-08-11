class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :some_contact
      t.string :your_name
      t.string :your_email
      t.string :your_message

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
