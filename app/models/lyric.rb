class Lyric < ActiveRecord::Base
  belongs_to :album
  validates_presence_of :title, :text_song
end
