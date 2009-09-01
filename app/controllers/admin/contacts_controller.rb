class Admin::ContactsController < ProtectedController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      flash[:notice] = "Contact created"
      redirect_to admin_contact_path(@contact)
    else
      render new_admin_contact_path
    end
  end
    
  def show
    @contact = Contact.find(params[:id])
  end
  
  def index
    @contacts = Contact.paginate :page => params[:page], :per_page => 3
  end
  
  def edit
    @contact = Contact.find(params[:id])
  end
  
  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      redirect_to admin_contact_path(@contact)
    else
      redirect_to :action => 'edit'
    end
  end
  
  def destroy
     @contact = Contact.find(params[:id])
     @contact.destroy
     redirect_to :action => 'index'
   end
end
