class Participant < ActiveRecord::Base
  after_create :rename_file
  validates_presence_of :name, :bio, :title_photo_small, :title_photo_big
  
  has_attached_file :file, :style => {:medium => "500x500", :small => "100x100"}
  
  protected

   def rename_file
     update_attribute :title_photo_small, file_file_name
   end
end
