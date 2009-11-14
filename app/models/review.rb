class Review < ActiveRecord::Base  
  validates_presence_of :title, :date, :author, :body
  
end
