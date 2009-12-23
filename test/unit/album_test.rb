require File.dirname(__FILE__) + '/../test_helper'

class AlbumTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  context "album" do
    should_have_and_belong_to_many :tracks
    should_validate_presence_of :title
  end
  
end
