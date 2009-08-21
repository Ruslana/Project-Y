class Admin::AlbumsController < ProtectedController
  
  def new
     @album = Album.new
   end

   def create
     last_album = Album.new(params[:album])
     if last_album.save
       flash[:notice] = "Альбомчик создан" 
       redirect_to admin_album_path(last_album)
     else
       flash[:notice] = "Извините, альбомчик не создан" 
       render new_admin_album_path
     end
   end

   def show
     @album = Album.find(params[:id])
     @lyrics = @album.lyrics
   end

   def index
     @albums = Album.paginate :page => params[:page], :per_page => 3
   end

   def edit
     @album = Album.find(params[:id])
   end

   def update
     @album = Album.find(params[:id])
     if @album.update_attributes(params[:album])
       redirect_to admin_album_path(@album)
     else
       redirect_to :action => 'edit'
     end
   end

   def destroy
      @album = Album.find(params[:id])
      @album.destroy
      redirect_to :action => 'index'
    end
end
