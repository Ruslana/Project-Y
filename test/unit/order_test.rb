require File.dirname(__FILE__) + '/../test_helper'

class OrderTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  context "order" do
    should_have_many :transactions
  end
  
end
