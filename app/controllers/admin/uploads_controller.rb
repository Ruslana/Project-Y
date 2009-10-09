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
  
  def edit
    @upload = Upload.find(params[:id])
  end
  
  def show
    @upload = Upload.find(params[:id])
  end
  
  def index
    @uploads = Upload.paginate :page => params[:page], :per_page => 10
  end
  
  def update
    @upload = Upload.find(params[:id])
    if @upload.update_attributes(params[:upload])
      redirect_to admin_upload_path(@upload)
    else
      redirect_to :action => 'edit'
    end
  end
  
  def destroy
     @upload = Upload.find(params[:id])
     @upload.destroy
     redirect_to :action => 'index'
   end
   
end
