class RemoveParticipantId < ActiveRecord::Migration
  def self.up
    remove_column :photos, :participant_id
  end

  def self.down
    add_column :photos, :participant_id, :integer
  end
end
