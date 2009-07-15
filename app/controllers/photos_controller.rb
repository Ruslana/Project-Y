class PhotosController < ApplicationController
  
  def index
    @photos = Photo.all
    render :layout => "band1"
  end
  
end
