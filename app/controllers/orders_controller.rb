class OrdersController < ApplicationController
  include ActiveMerchant::Billing

   def index
     @orders = Order.all
   end
   
   def create
     @order = Order.create params[:order]
     redirect_to order_path(:id => @order.secret_hash)
   end
   
   def show
     @order = Order.find_by_secret_hash(params[:id])
   end
   
   def confirm
     @order = Order.find_by_secret_hash(params[:id])
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
     @order = Order.find_by_secret_hash(params[:id])
     purchase = gateway.purchase(@order.amount,
       :ip       => request.remote_ip,
       :payer_id => params[:payer_id],
       :token    => params[:token]
     )

    if !purchase.success?
      @message = purchase.message
      @order.payment_error!
    else
      OrderMailer.deliver_confirm(@order)
      @order.complete!
    end
    redirect_to :action => 'show', :id => @order.secret_hash
   end

   def checkout
     @order = Order.find_by_secret_hash(params[:id])
     setup_response = gateway.setup_purchase(@order.amount,
       :ip                => request.remote_ip,
       :return_url        => url_for(:action => 'confirm', :id => @order.secret_hash, :only_path => false),
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
