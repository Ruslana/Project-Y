require File.dirname(__FILE__) + '/../test_helper'

class UploadedFileTest < ActiveSupport::TestCase
  context "upload" do
    should_belong_to :track
  end
end
