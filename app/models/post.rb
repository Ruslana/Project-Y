class Post < ActiveRecord::Base
    
  validates_presence_of :title, :published_at, :body
  
end
