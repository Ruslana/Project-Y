class Order < ActiveRecord::Base
  has_many :transactions, 
           :class_name => 'OrderTransaction', 
           :dependent => :destroy
           
  acts_as_state_machine :initial => :pending 
  
  state :pending 
  state :authorized 
  state :paid 
  state :payment_declined 
  
  event :payment_authorized do  
    transitions :from => :pending, 
                :to   => :authorized 
    transitions :from => :payment_declined, 
                :to   => :authorized 
  end
  
  event :payment_captured do 
    transitions :from => :authorized,
                :to   => :paid 
  end 
  
  event :transaction_declined do 
    transitions :from => :pending, 
                :to   => :payment_declined 
    transitions :from => :payment_declined, 
                :to   => :payment_declined 
    transitions :from => :authorized, 
                :to   => :authorized 
  end 
  
  def authorize_payment(money, options = {}) 
    options[:order_id] = number 
    transaction do 
      authorization = OrderTransaction.authorize(money, options) 
      transactions.push(authorization) 
      if authorization.success? 
        payment_authorized! 
      else 
        transaction_declined! 
      end 
      authorization 
    end 
  end 
  
  def number 
    "#{Time.now.to_i}-#{rand(1_000_000)}"
  end 
  
  def authorization_reference 
    if authorization = transactions.find_by_action_and_success('authorization', true, :order => 'id ASC') 
      authorization.reference 
    end 
  end 
  
  def capture_payment(options = {}) 
    transaction do 
      capture = OrderTransaction.capture(amount, authorization_reference, options) 
      transactions.push(capture) 
      if capture.success? 
        payment_captured! 
      else 
        transaction_declined!
      end 
      capture 
    end 
  end 
      
end
