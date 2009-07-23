class Participant < ActiveRecord::Base
  
  validates_presence_of :name, :bio
  
end
