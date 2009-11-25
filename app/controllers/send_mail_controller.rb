class SendMailController < ApplicationController
  def create_order 
    order = Order.find(params[:id]) 
    email = OrderMailer.create_confirm(order) 
    email.set_content_type("text/html") 
    OrderMailer.deliver(email) 
    render(:text => "Вам будет отправлено письмо с ссылкой для скачивания музыки, которую вы купили...")
  end
  
end
