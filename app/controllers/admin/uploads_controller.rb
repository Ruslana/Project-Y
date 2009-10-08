class Admin::UploadsController < ProtectedController
  def new
    @upload = Upload.new
  end
  
  def create
    @upload = Upload.create(params[:upload])
    if @upload.save
      flash[:notice] = "File uploaded"
      redirect_to admin_upload_path(@upload)
    else
      render new_admin_upload_path
    end
  end
  
  def show
    @upload = Upload.find(params[:id])
  end
  
  def index
    @uploads = Upload.paginate :page => params[:page], :per_page => 10
  end
  
  def destroy
     @upload = Upload.find(params[:id])
     @upload.destroy
     redirect_to :action => 'index'
   end
   
end