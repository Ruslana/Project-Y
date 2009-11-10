class OrderTransaction < ActiveRecord::Base
  belongs_to :order 
  serialize :params 
  cattr_accessor :gateway 

  class << self 
    def authorize(money, options = {}) 
      process('authorization', money) do |gw| 
        gw.authorize(amount, credit_card, options) 
      end 
    end 

    def capture(amount, authorization, options = {}) 
      process('capture', amount) do |gw| 
        gw.capture(amount, authorization, options) 
      end 
    end 

    private 

    def process(action, money = nil) 
      result = OrderTransaction.new 
      result.money = money 
      result.action = action 
      begin 
        response = yield gateway 

        result.success   = response.success? 
        result.reference = response.authorization 
        result.message   = response.message 
        result.params    = response.params 
        result.test      = response.test? 
      rescue ActiveMerchant::ActiveMerchantError => e 
        result.success   = false 
        result.reference = nil 
        result.message   = e.message 
        result.params    = {} 
        result.test      = gateway.test? 
      end 

      result 
    end 
  end 
  
end
