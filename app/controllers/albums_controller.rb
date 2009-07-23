class AlbumsController < ApplicationController
  
  def show
     @album = Album.find(params[:id])
     @lyrics = @album.lyrics
   end

   def index
     @albums = Album.paginate :page => params[:page], :per_page => 3
   end
  
end
