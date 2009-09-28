require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase
  context "User" do
    should_validate_presence_of :name
    
  end
end
