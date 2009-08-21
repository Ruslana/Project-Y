ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'

class ActiveSupport::TestCase
  
  include ActiveMerchant::Billing 
  
  def credit_card_hash(options = {}) 
    { :number     => '1',
      :first_name => 'Cody', 
      :last_name  => 'Fauser', 
      :month      => '8', 
      :year       => "#{ Time.now.year + 1 }", 
      :verification_value => '123', 
      :type       => 'visa' 
    }.update(options) 
  end
   
  def credit_card(options = {}) 
    ActiveMerchant::Billing::CreditCard.new( credit_card_hash(options) ) 
  end 
  
  self.use_transactional_fixtures = true

  self.use_instantiated_fixtures  = false

  fixtures :all

end
