require File.dirname(__FILE__) + '/../test_helper'

class OrderMailerTest < ActiveSupport::TestCase
  
  context "Order Mailer" do
    setup do
      @order = Factory(:order)
    end
    
    should "confirm" do
      OrderMailer.deliver_confirm(@order)
      
      assert_sent_email do |email|
        email.subject = 'OrderMailer#confirm'
        email.body    = 'bla'
      end
    end   
  end
  
end


