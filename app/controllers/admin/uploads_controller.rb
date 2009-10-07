class Admin::UploadsController < ProtectedController
  def new
    @upload = Upload.new
  end
  
  def create
    if @upload = Upload.create(params[:upload])
    @upload.save
      flash[:notice] = "File uploaded"
      admin_upload_path(@upload)
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
