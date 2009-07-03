require 'test_helper'

class ParticipantTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  context "participant" do
    should_validate_presence_of :name, :bio, :title_photo_small, :title_photo_big
  end
  
end
