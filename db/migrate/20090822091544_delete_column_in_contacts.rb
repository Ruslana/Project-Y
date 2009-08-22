class DeleteColumnInContacts < ActiveRecord::Migration
  def self.up
    remove_column :contacts, :your_name
    remove_column :contacts, :your_email
    remove_column :contacts, :your_message
  end

  def self.down
    add_column :contacts, :your_name, :string
    add_column :contacts, :your_email, :string
    add_column :contacts, :your_message, :string
  end
end
