class AlbumsController < ApplicationController
  
  def show
     @album = Album.find(params[:id])
   end

   def index
     @albums = Album.all(:limit => 10, :order => 'created_at DESC')
     @albums = Album.paginate :page => params[:page], :per_page => 3
   end
  
end
