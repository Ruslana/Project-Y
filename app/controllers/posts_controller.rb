class PostsController < ApplicationController
  
  def index
    @posts = Post.paginate :page => params[:page], :per_page => 3, :order => "published_at DESC"
  end
   
end
