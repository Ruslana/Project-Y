require File.dirname(__FILE__) + '/../test_helper'

class ContactTest < ActiveSupport::TestCase
  context "Contact" do
    should_validate_presence_of :some_contact
  end
end
