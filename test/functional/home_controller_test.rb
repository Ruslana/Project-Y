require File.dirname(__FILE__) + '/../test_helper'

class HomeControllerTest < ActionController::TestCase
  context "Controller Home" do
    setup do
      @album = Factory(:album)
     end

    context "on GET :index" do
      setup do
        get :index
      end

      should_respond_with :success
      should_assign_to :posts
      should_render_template :index
    end
  end
end
