class Photo < ActiveRecord::Base
  
  after_create :rename_file
  
  has_attached_file :file, :styles => {:medium => "500x500", :small => "100x100"}
  
  protected

   def rename_file
     update_attribute :name, file_file_name
   end
   
end
