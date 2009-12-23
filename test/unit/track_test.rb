require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  # Replace this with your real tests.
 context "track" do
   should_have_one :lyric
   should_have_one :audio_file_full
   should_have_one :audio_file_cut
   should_have_and_belong_to_many :albums
   should_have_and_belong_to_many :orders
 end
end
