class Upload < ActiveRecord::Base
  has_and_belongs_to_many :albums, :join_table => 'albums_uploads'
  
  after_create :rename_music
  after_update :rename_file
  
  has_attached_file :music
  has_attached_file :file
  
  protected
  
  def rename_music
    update_attribute :name, music_file_name
    update_attribute :title, file_file_name
  end
  
  def rename_file
    update_attribute :title, file_file_name
  end
  
end
