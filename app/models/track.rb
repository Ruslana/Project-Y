class Track < ActiveRecord::Base
  
  has_one :lyric
  has_one :audio_file_full, :class_name => "UploadedFile"
  has_one :audio_file_cut, :class_name => "UploadedFile"
  has_and_belongs_to_many :albums, :join_table => 'albums_tracks'
  has_and_belongs_to_many :orders, :join_table => 'orders_tracks'
  
end
