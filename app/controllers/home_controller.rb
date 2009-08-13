class HomeController < ApplicationController
  def index
    @post = Post.last
  end
end
