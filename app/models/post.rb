class Post < ActiveRecord::Base
  
  validates_presence_of :title, :date, :body
  
  def self.find_or_create(title, body, date)
    Post.last || Post.create(:title => title, :body => body, :date => date)    
  end
  
end
