class TracksController < ApplicationController
  def index
    @tracks = Track.all
    @order = Order.new
  end
  
end
