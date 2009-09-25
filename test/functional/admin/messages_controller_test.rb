require File.dirname(__FILE__) + '/../../test_helper'

class Admin::MessagesControllerTest < ActionController::TestCase
  context "Admin Messages contreller" do
    context "on GET :index" do
      setup do
        get :index
      end
      
      should_respond_with :success
      should_assign_to :messages
      should_render_template :index
    end
    
    context "on DELETE to :destroy" do
       setup do
         @message = Factory(:message)
         delete :destroy, :id => @message.id
       end

       should "destroy message" do
         assert ! Message.exists?(@message.id)
       end

       should_redirect_to "Admin::Message#index" do
         admin_messages_path
       end
     end
  end
end
