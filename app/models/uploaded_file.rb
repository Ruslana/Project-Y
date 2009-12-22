class UploadedFile < ActiveRecord::Base
  
  belongs_to :track
  
  has_attached_file :music
  
end
