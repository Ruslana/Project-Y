class UploadedFile < ActiveRecord::Base
  
  belongs_to :track
   
  #before_save :rename_file
  
  has_attached_file :music
  
  
  protected
  
  def rename_file
    self.title = file_file_name
    self.name = music_file_name
  end
  
end
