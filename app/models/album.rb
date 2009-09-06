class Album < ActiveRecord::Base
  has_many :lyrics
  validates_presence_of :title
  
  def self.find_or_create
    Album.last || Album.create(:title => "title", :description => "description")    
  end
   
end
