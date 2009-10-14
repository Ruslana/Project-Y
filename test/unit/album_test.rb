require File.dirname(__FILE__) + '/../test_helper'

class AlbumTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  context "album" do
    should_have_many :lyrics
    should_have_and_belong_to_many :uploads
    should_validate_presence_of :title
  end
  
end
