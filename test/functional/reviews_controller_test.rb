require File.dirname(__FILE__) + '/../test_helper'

class ReviewsControllerTest < ActionController::TestCase
  setup do
    @album = Factory(:album)
  end

   context "on GET :index" do
     setup do
       get :index
     end

     should_respond_with :success
     should_assign_to :reviews
     should_render_template :index
   end
end
