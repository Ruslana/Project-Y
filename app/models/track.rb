class Track < ActiveRecord::Base
  
  has_one :audio_file_full, :class_name => "Upload"
  has_one :audio_file_cut, :class_name => "Upload"
  
end
