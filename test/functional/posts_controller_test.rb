require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  context "Posts controller" do
    context "on GET to :show" do
      setup do
        @post = Factory(:post)
        get :show, :id => @post.id
      end
     
      should_respond_with :success
      should_assign_to :post
      should_render_template :show
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
