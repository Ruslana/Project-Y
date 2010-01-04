class MessagesController < ApplicationController
  
  def create
    @message = Message.new(params[:message])
    if @message.save
      flash[:notice] = "Messege created"
      redirect_to contacts_path
    else
      render contacts_path
    end
  end
  
end
