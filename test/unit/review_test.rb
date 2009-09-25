require File.dirname(__FILE__) + '/../../test_helper'

class ReviewTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  context "review" do
    should_validate_presence_of :title, :date, :author, :body
  end
end
