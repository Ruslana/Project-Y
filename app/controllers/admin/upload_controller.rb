class Admin::UploadController < ProtectedController
  def new
    @upload = Upload.new
  end
  
  def create
    @upload = Upload.new(params[:upload])
    if @upload.save
      flash[:notice] = "File uploaded"
      redirect_to :action => 'show', :id => @upload.id
      #admin_upload_path(@upload)
    else
      render new_admin_upload_path
    end
  end
  
  def show
    @upload = Upload.find(params[:id])
  end
  
  def index
  end
  
end
