class HomeController < ApplicationController
  def index
    @posts = Post.all :order => "published_at DESC"
  end
end
