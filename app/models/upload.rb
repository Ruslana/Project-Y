class Upload < ActiveRecord::Base
  after_create :rename_file
  
  protected
  
  def rename_file
    update_attribute :name, file_name
  end
  
end
