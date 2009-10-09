class Upload < ActiveRecord::Base
  
  after_create :rename_file
  
  has_attached_file :music
  has_attached_file :file
  
  protected
  
  def rename_file
    update_attribute :name, music_file_name
    update_attribute :title, file_file_name
  end
  
end
