class Admin::MessagesController < ProtectedController
  
  def index
    @messages = Message.paginate :page => params[:page], :per_page => 10
  end
  
  def destroy
     @message = Message.find(params[:id])
     @message.destroy
     redirect_to admin_messages_path
  end
   
end
