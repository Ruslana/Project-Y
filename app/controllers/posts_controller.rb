class PostsController < ApplicationController
  
  def show     
     current_post = Post.last
   end

   def index
     @posts = Post.paginate :page => params[:page], :per_page => 3
   end
   
end
