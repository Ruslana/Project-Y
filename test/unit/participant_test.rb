require File.dirname(__FILE__) + '/../../test_helper'

class ParticipantTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  context "participant" do
    should_validate_presence_of :name, :bio
  end
  
end
