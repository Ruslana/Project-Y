require File.dirname(__FILE__) + '/../../test_helper' 

class OrderIntegrationTest < ActiveSupport::TestCase  
  def setup 
    OrderTransaction.gateway = PaypalGateway.new( 
                                 :login    => 'ruslan_1257315837_biz_api1.gmail.com', 
                                 :password => '1257315903',
                                 :signature => 'AFcWxV21C7fd0v3bYYYRCpSSRl31AwI3GB8u9URGrjFPwoZvZzN3nQNT' 
                               ) 
    
    @order = orders(:pending) 
    @credit_card = credit_card(:number => '4224645442396111') 
    @options = { :description => 'A store purchase', 
                 :billing_address => address,
                 :ip => '127.0.0.1'
               } 
  end 
  
  def test_successful_order_authorization 
    assert_difference '@order.transactions.count' do 
      authorization = @order.authorize_payment(@credit_card, @options) 
      assert_equal authorization.reference, 
                   @order.authorization_reference 
      assert authorization.success? 
      assert @order.authorized? 
    end 
  end 
    
  def test_authorization_unsuccessful_with_invalid_credit_card_number 
    @credit_card.number = 'invalid'
    
    assert_difference '@order.transactions.count' do 
      authorization = @order.authorize_payment(@credit_card, @options) 
      assert_nil @order.authorization_reference 
      assert !authorization.success? 
      assert @order.payment_declined?
    end 
  end 
  
  def test_successful_authorization_and_capture 
    assert_difference '@order.transactions.count', 2 do 
      authorization = @order.authorize_payment(@credit_card, @options) 
      assert authorization.success? 
      assert @order.authorized? 

      capture = @order.capture_payment 
      assert capture.success? 
      assert @order.paid? 
    end 
  end 

  def test_authorization_and_unsuccessful_capture 
    assert_difference '@order.transactions.count', 2 do 
      authorization = @order.authorize_payment(@credit_card, @options) 
      assert authorization.success? 
      assert @order.authorized? 

      authorization_transaction = @order.transactions.first 
      authorization_transaction.update_attribute(:reference, '') 

      capture = @order.capture_payment 
      assert !capture.success? 
      assert @order.authorized? 
    end 
  end 
end 
