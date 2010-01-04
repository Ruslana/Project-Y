require 'test_helper'

class TracksControllerTest < ActionController::TestCase
  context "Controller Tracks" do
    setup do
      @album = Factory(:album)
     end

    context "on GET :index" do
      setup do
        get :index
      end

      should_respond_with :success
      should_assign_to :tracks
      should_assign_to :order
      should_render_template :index
    end
  end
end
