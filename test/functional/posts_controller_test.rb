require File.dirname(__FILE__) + '/../test_helper'

class PostsControllerTest < ActionController::TestCase
  context "Posts controller" do
    setup do
      @album = Factory(:album)
     end
    
    context "on GET to :index" do
      setup do
        get :index
      end
      
      should_respond_with :success
      should_assign_to :posts
      should_render_template :index
    end
    
  end
end
