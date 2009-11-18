class OrdersController < ApplicationController
  include ActiveMerchant::Billing

   def index
     @album = Album.last
     @order = Order.new
   end
   
   def before_purchase
     @order = Order.new(params[:order])
     @order.amount = Order.calculate_sum(@order)
     @order.save
   end

   def confirm
     @order = Order.find(params[:id])
     redirect_to :action => 'index' unless params[:token]
     details_response = gateway.details_for(params[:token])
     if !details_response.success?
       @message = details_response.message
       render :action => 'error'
       return
     end

    @address = details_response.address
   end

   def error
   end

   def complete
     @order = Order.find(params[:id])
     purchase = gateway.purchase(@order.amount,
       :ip       => request.remote_ip,
       :payer_id => params[:payer_id],
       :token    => params[:token]
     )

    if !purchase.success?
      @message = purchase.message
      render :action => 'error'
      return
    end
   end

   def checkout
     @order = Order.find(params[:id])
     setup_response = gateway.setup_purchase(@order.amount,
       :ip                => request.remote_ip,
       :return_url        => url_for(:action => 'confirm', :id => @order.id, :only_path => false),
       :cancel_return_url => url_for(:action => 'index', :only_path => false)
     )
     redirect_to gateway.redirect_url_for(setup_response.token)
   end

   private

   def gateway
     PaypalExpressGateway.ssl_strict = false
     @gateway ||= PaypalExpressGateway.new(
       :login    => 'ruslan_1257315837_biz_api1.gmail.com', 
       :password => '1257315903',
       :signature => 'AFcWxV21C7fd0v3bYYYRCpSSRl31AwI3GB8u9URGrjFPwoZvZzN3nQNT'
     )
   end
  
end
