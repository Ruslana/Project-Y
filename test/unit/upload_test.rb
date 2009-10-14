require File.dirname(__FILE__) + '/../test_helper'

class UploadTest < ActiveSupport::TestCase
  context "upload" do
    should_have_and_belong_to_many :albums
    
  end
end
