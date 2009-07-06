class PostsController < ApplicationController
  
  def show
     
     @post = Post.find(params[:id])
     render :layout => "index"
   end

   def index
     @posts = Post.all(:limit => 10, :order => 'created_at DESC')
     @posts = Post.paginate :page => params[:page], :per_page => 3
   end
end
