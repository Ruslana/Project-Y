require File.dirname(__FILE__) + '/../test_helper'

class OrderTest < ActiveSupport::TestCase
  
  context "Order" do
      setup do 
        @order = Order.create(
          :complete => true,
          :email => 'bla@gmail.com',
          :gateway_error => false
        )
      end

      should "generate secret hash before create" do
        assert @order.secret_hash.kind_of?(String)
        assert @order.secret_hash.size > 14
      end

  end
end
