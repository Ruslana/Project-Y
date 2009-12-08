class Admin::AlbumsController < ProtectedController
  
  def new
     @album = Album.new
   end

   def create
     @album = Album.new(params[:album])
     if @album.save
       flash[:notice] = "Album created" 
       redirect_to admin_album_path(@album)
     else
       render new_admin_album_path
     end
   end

   def show
     @album = Album.find(params[:id])
     @lyrics = @album.lyrics
     @uploads = @album.uploads
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
