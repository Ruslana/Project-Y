class Admin::UploadedFilesController < ProtectedController
  
  def new
    @track = Track.find(params[:id])
    @upload = UploadedFile.new
  end
  
  def create
    if @upload = UploadedFile.create(params[:upload])
      flash[:notice] = "File uploaded"
      redirect_to admin_uploaded_file_path(@upload)
    else
      render new_admin_uploaded_file_path
    end
  end
  
  def edit
    @upload = UploadedFile.find(params[:id])
    @albums = Album.find(:all)
  end
  
  def show
    @upload = UploadedFile.find(params[:id])
  end
  
  def index
    @uploads = UploadedFile.paginate :page => params[:page], :per_page => 10
  end
  
  def update
    @upload = UploadedFile.find(params[:id])
    if @upload.update_attributes(params[:upload])
      redirect_to admin_uploaded_file_path(@upload)
    else
      redirect_to :action => 'edit'
    end
  end
  
  def destroy
     @upload = UploadedFile.find(params[:id])
     @upload.destroy
     redirect_to :action => 'index'
   end
   
end
