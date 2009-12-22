class Admin::TracksController < ProtectedController
  
  def new
    @track = Track.new
    @albums = Album.all
  end
  
  def create
    if @track = Track.create(params[:track])
      flash[:notice] = "File tracked"
      redirect_to admin_track_path(@track)
    else
      render new_admin_track_path
    end
  end
  
  def edit
    @track = Track.find(params[:id])
    @albums = Album.all
  end
  
  def show
    @track = Track.find(params[:id])
    #@track.preview_id = params[:preview_id]
    #@track.full_version_audio_id = params[:full_version_audio_id]
    @track.save!
  end
  
  def index
    @tracks = Track.paginate :page => params[:page], :per_page => 10
  end
  
  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(params[:track])
      redirect_to admin_track_path(@track)
    else
      redirect_to :action => 'edit'
    end
  end
  
  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to :action => 'index'
  end
  
end
