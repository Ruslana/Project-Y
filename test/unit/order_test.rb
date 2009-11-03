require File.dirname(__FILE__) + '/../test_helper'

class OrderTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  context "order" do
    should_have_many :transactions
  end
  
  def test_successful_order_authorization 
    order = orders(:pending) 
    credit_card = credit_card(:number => '1') 

    assert_difference 'order.transactions.count' do 
      authorization = order.authorize_payment(credit_card) 
      assert_equal authorization.reference, 
                   order.authorization_reference 
      assert authorization.success? 
      assert order.authorized? 
    end 
  end 
  
  def test_failed_order_authorization 
    order = orders(:pending) 
    credit_card = credit_card(:number => '2') 

    assert_difference 'order.transactions.count' do 
      authorization = order.authorize_payment(credit_card) 
      assert_nil order.authorization_reference 
      assert !authorization.success? 
      assert order.payment_declined? 
    end 
  end 
  
  def test_exception_raised_during_authorization 
    order = orders(:pending) 
    credit_card = credit_card(:number => '3') 

    assert_difference 'order.transactions.count' do 
      authorization = order.authorize_payment(credit_card) 
      assert_nil order.authorization_reference 
      assert !authorization.success? 
      assert order.payment_declined? 
    end
  end
  
end
