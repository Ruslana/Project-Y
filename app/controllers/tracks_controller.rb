class TracksController < ApplicationController
  def index
    @uploads = Upload.all
    @order = Order.new
  end
  
end
