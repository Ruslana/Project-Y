class Album < ActiveRecord::Base
  has_many :lyrics
  validates_presence_of :title
  
  def self.find_or_create(title, description)
    Album.find_by_title(title) || Album.create(:title => title, :description => "description")    
  end
   
end
