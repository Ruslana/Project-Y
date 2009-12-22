class Admin::LyricsController < ProtectedController
  
  def new
    @lyric = Lyric.new
    @track = Track.find(params[:id])
  end
  
   def create
     @lyric = Lyric.new(params[:lyric])
     @track = Track.find(params[:lyric][:track_id])
     @lyric.track = @track
     if @lyric.save
       flash[:notice] = "Lyric created"
       redirect_to admin_lyrics_path
     else
       render admin_albums_path
     end
   end

   def show
     @lyric = Lyric.find(params[:id])
     @track = @lyric.track
   end

   def index
     @lyrics = Lyric.all
   end

   def edit
     @lyric = Lyric.find(params[:id])
     @track = @lyric.track
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
