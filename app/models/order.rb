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
    
end
