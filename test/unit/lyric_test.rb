require File.dirname(__FILE__) + '/../test_helper'

class LyricTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  context "lyric" do
    should_belong_to :track
    should_validate_presence_of :title, :text_song
  end
  
end
