class PostsController < ApplicationController
  
  def show     
     @post = Post.last
     render :layout => "index"
   end

   def index
     @posts = Post.paginate :page => params[:page], :per_page => 3
   end
end
