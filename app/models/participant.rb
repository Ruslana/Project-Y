class Participant < ActiveRecord::Base
  
  validates_presence_of :name, :bio, :title_photo_small, :title_photo_big
end
