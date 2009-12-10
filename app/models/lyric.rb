class Lyric < ActiveRecord::Base
  
  belongs_to :track
  validates_presence_of :title, :text_song
  
end
