class Upload < ActiveRecord::Base
  has_and_belongs_to_many :albums, :join_table => 'albums_uploads'
  has_and_belongs_to_many :orders, :join_table => 'orders_uploads'
  
  before_save :rename_file
  
  has_attached_file :music
  has_attached_file :file
  
  protected
  
  def rename_file
    self.title = file_file_name
    self.name = music_file_name
  end
  
end
