class PostsController < ApplicationController
  
  def show     
     @post ||= Post.find_or_create("Пост", "blabla", Date.new)
   end

   def index
     @posts = Post.paginate :page => params[:page], :per_page => 3
   end
   
end
