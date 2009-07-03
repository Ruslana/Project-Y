require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  context "post" do
    should_validate_presence_of :title, :date, :body
  end
  
end
