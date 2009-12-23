require 'test_helper'

class Admin::TracksControllerTest < ActionController::TestCase
  # Replace this with your real tests.
context "Admin Tracks controller" do

  setup do
     @user = Factory(:user)
     session[:user_id] = @user.id
  end

  context "on GET to :new" do
    setup do
      get :new
    end

    should_respond_with :success
    should_assign_to :track
    should_render_template :new
  end

  context "on POST to :create" do
    setup do
      post :create, :track => {:title_full_file => 'title_full_file', 
                              :title_cut_file => 'title_cut_file',
                              :price => "3",
                              :time => "2:00"
                              }
    end

    teardown do
      Track.destroy_all
    end

    should_redirect_to "Admin::Tracks#show" do
      admin_track_path(Track.first)
    end

    should "create track" do
      assert Track.exists?(:title_full_file => 'title_full_file')
    end
  end

  context "on GET to :show" do
    setup do
      @track = Factory(:track)
      get :show, :id => @track.id
    end

    should_respond_with :success
    should_assign_to :track
    should_render_template :show
  end

  context "on GET :index" do
    setup do
      get :index
    end

    should_respond_with :success
    should_assign_to :tracks
    should_render_template :index
  end

  context "on GET to :edit" do
     setup do
       @track = Factory(:track)
       get :edit, :id => @track.id
     end

     should_respond_with :success
     should_assign_to :track
     should_render_template :edit
   end

   context "on PUT to :update" do
   setup do
     @track = Factory(:track, :title_full_file => "old", :title_cut_file => "old")
     put :update, :id => @track.id, :track => {:title_full_file => "new", :title_cut_file => "new"}
   end

   should_redirect_to "Admin::Track#show" do
     admin_track_path(@track)
   end

   should "update track" do
     @track.reload
     assert_equal "new", @track.title_full_file
     assert_equal "new", @track.title_cut_file
   end
 end

  context "on DELETE to :destroy" do
    setup do
      @track = Factory(:track)
      delete :destroy, :id => @track.id
    end

    should "destroy track" do
      assert ! Track.exists?(@track.id)
    end

    should_redirect_to "Admin::Track#index" do
      admin_tracks_path
    end
  end

end
 
end
