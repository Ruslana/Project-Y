class TracksController < ApplicationController
  def index
    @uploads = Upload.all
    @order = Order.new
    @album = Album.last
  end
  
end
