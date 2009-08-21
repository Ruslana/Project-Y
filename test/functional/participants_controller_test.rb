require 'test_helper'

class ParticipantsControllerTest < ActionController::TestCase
  setup do
    @album = Factory(:album)
   end
   
   context "on GET to :show" do
      setup do
        @participant = Factory(:participant)
        get :show, :id => @participant.id
      end

      should_respond_with :success
      should_render_template :show
  end
    
end
