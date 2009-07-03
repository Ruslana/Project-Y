class Album < ActiveRecord::Base
  has_many :lyrics
  validates_presence_of :title
  
end
