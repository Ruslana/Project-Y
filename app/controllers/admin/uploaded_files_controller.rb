class Admin::UploadedFilesController < ProtectedController
  
  def new
    @track = Track.find(params[:id])
    @uploaded_file = UploadedFile.new
  end
  
  def create
    if @uploaded_file = UploadedFile.create(params[:uploaded_file])
      flash[:notice] = "File uploaded"
      redirect_to admin_uploaded_file_path(@uploaded_file)
    else
      render new_admin_uploaded_file_path
    end
  end
  
  def edit
    @uploaded_file = UploadedFile.find(params[:id])
  end
  
  def show
    @uploaded_file = UploadedFile.find(params[:id])
  end
  
  def index
    @uploaded_files = UploadedFile.paginate :page => params[:page], :per_page => 10
  end
  
  def update
    @uploaded_file = UploadedFile.find(params[:id])
    if @uploaded_file.update_attributes(params[:uploaded_file])
      redirect_to admin_uploaded_file_path(@uploaded_file)
    else
      redirect_to edit_admin_uploaded_file_path(@uploaded_file)
    end
  end
  
  def destroy
     @uploaded_file = UploadedFile.find(params[:id])
     @uploaded_file.destroy
     redirect_to admin_uploaded_files_path
   end
   
end
