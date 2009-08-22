class MessagesController < ApplicationController
  def create
    @message = Message.new(params[:message])
    if @message.save
      redirect_to contacts_path
    else
      render contacts_path
    end
  end
end
