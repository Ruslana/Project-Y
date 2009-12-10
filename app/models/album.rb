class Album < ActiveRecord::Base
  
  has_and_belongs_to_many :tracks, :join_table => 'albums_tracks'
  
  validates_presence_of :title
  
  def self.find_or_create
    Album.last || Album.create(:title => "title", :description => "description")    
  end
   
end
