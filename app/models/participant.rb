class Participant < ActiveRecord::Base
  
  after_create :rename_avatar
  
  validates_presence_of :name, :bio
  
  has_attached_file :avatar, :styles => {:medium => "500x500", :small => "100x100"}
  
  protected

    def rename_avatar
      update_attribute :title, avatar_file_name
    end
  
  
end
