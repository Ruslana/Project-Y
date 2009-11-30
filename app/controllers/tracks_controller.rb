class TracksController < ApplicationController
  def index
    @uploads = Upload.all
    @order = Order.new
    @albums = Album.all
  end
  
end
