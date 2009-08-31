class Admin::LyricsController < ProtectedController
  
   def create
     @lyric = Lyric.new(params[:lyric])
     @album = Album.find(params[:lyric][:album_id])
     @lyric.album = @album
     if @lyric.save
       flash[:notice] = "Lyric created"
       redirect_to admin_lyrics_path
     else
       flash[:notice] = "Sorry, lyric don't created"
       render admin_albums_path
     end
   end

   def show
     @lyric = Lyric.find(params[:id])
   end

   def index
     @lyrics = Lyric.all
   end

   def edit
     @lyric = Lyric.find(params[:id])
   end

   def update
     @lyric = Lyric.find(params[:id])
     if @lyric.update_attributes(params[:lyric])
       redirect_to admin_lyric_path(@lyric)
     else
       redirect_to :action => 'edit'
     end
   end

   def destroy
      @lyric = Lyric.find(params[:id])
      @lyric.destroy
      redirect_to :action => 'index'
    end
  
end
