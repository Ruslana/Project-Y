class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      redirect_to contacts_path
    else
      render new_contact_path
    end
  end
  
  def index
    @contacts = Contact.paginate :page => params[:page], :per_page => 3
    @contact = Contact.new
  end
end
