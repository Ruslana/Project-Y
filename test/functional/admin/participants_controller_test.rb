require File.dirname(__FILE__) + '/../../test_helper'

class Admin::ParticipantsControllerTest < ActionController::TestCase
  context "Admin Participants controller" do

     setup do
      @album = Factory(:album)  
      @user = Factory(:user)
      session[:user_id] = @user.id    
     end

     context "on Participant to :create" do
       setup do       
         post :create, :participant => {
           :name => 'thomas', 
           :bio => 'bio'
           }
       end

       teardown do
         Participant.destroy_all
       end

       should_redirect_to "Admin::participants#show" do
         admin_participant_path(Participant.last)
       end

       should "create participant" do
         assert Participant.exists?(:name => 'thomas')
       end
     end

     context "on GET to :show" do
       setup do
         @participant = Factory(:participant)
         get :show, :id => @participant.id
       end

       should_respond_with :success
       should_assign_to :participant
       should_render_template :show
     end

     context "on GET :index" do
       setup do
         get :index
       end

       should_respond_with :success
       should_assign_to :participants
       should_render_template :index
     end

     context "on GET to :edit" do
        setup do
          @participant = Factory(:participant)
          get :edit, :id => @participant.id
        end

        should_respond_with :success
        should_assign_to :participant
        should_render_template :edit
        should_render_a_form
      end

      context "on PUT to :update" do
      setup do
        @participant = Factory(:participant, 
                              :name => 'thomas', 
                              :bio => "old")
        put :update, :id => @participant.id, :participant => {
          :name => "max", 
          :bio => "new"
          }
        end

      should_redirect_to "Admin::participant#show" do
        admin_participant_path(@participant)
      end

      should "update participant" do
        @participant.reload
        assert_equal "max", @participant.name
        assert_equal "new", @participant.bio
      end
    end

     context "on DELETE to :destroy" do
       setup do
         @participant = Factory(:participant)
         delete :destroy, :id => @participant.id
       end

       should "destroy participant" do
         assert ! Participant.exists?(@participant.id)
       end

       should_redirect_to "Admin::participant#index" do
         admin_participants_path
       end
     end

   end
end
