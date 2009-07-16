class Admin::PhotosController < ApplicationController
  
  def new
    @photo = Photo.new
    render :layout => 'admin_part'
  end
  
  def create    
    if @photo = Photo.create(params[:photo])
      redirect_to admin_photo_path(@photo)
    else
      render :action => "new"
    end
  end
  
  def index
     @photos = Photo.all
   end

   def show
     @photo = Photo.find(params[:id]) 
   end

   def destroy
     @photo = Photo.find(params[:id])
     @photo.destroy
     redirect_to :action => 'index'
   end
   
end
