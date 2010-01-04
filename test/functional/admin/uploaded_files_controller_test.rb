require File.dirname(__FILE__) + '/../../test_helper'

class Admin::UploadedFilesControllerTest < ActionController::TestCase
  context "Admin uploaded_files controller" do

    setup do
      @track = Factory(:track)
      @user = Factory(:user)
      session[:user_id] = @user.id
    end

    context "on GET to :new" do
      setup do
        get :new, :id => @track.id
      end

     should_respond_with :success
     should_assign_to :uploaded_file
     should_render_template :new
    end

   context "on POST to :create" do
     setup do
       post :create, :uploaded_file => {:music => fixture_file_upload('/files/rails.png', 'image/png') }                     
     end

     teardown do
       UploadedFile.destroy_all
     end

     should_redirect_to "Admin::uploaded_file#show" do
       admin_uploaded_file_path(UploadedFile.first)
     end

     should "create uploaded_file" do       
       assert UploadedFile.exists?(:music_file_name => "rails.png" )
     end
   end

   context "on GET to :show" do
     setup do
       @uploaded_file = Factory(:uploaded_file)
       get :show, :id => @uploaded_file.id
     end

     should_respond_with :success
     should_assign_to :uploaded_file
     should_render_template :show
   end

   context "on GET :index" do
     setup do
       get :index
     end

     should_respond_with :success
     should_assign_to :uploaded_files
     should_render_template :index
   end

   context "on GET to :edit" do
      setup do
        @uploaded_file = Factory(:uploaded_file)
        get :edit, :id => @uploaded_file.id
      end

      should_respond_with :success
      should_assign_to :uploaded_file
      should_render_template :edit
    end

    context "on PUT to :update" do
    setup do
      @uploaded_file = Factory(:uploaded_file)
      put :update, :id => @uploaded_file.id, :uploaded_file => {:music => fixture_file_upload('/files/girl.jpg', 'image/jpg')
         }
    end

    should_redirect_to "Admin::uploaded_file#show" do
      admin_uploaded_file_path(@uploaded_file)
    end

    should "update uploaded_file" do
      @uploaded_file.reload
      assert_equal "girl.jpg", @uploaded_file.music_file_name
    end
  end

  context "on DELETE to :destroy" do
   setup do
     @uploaded_file = Factory(:uploaded_file)
     delete :destroy, :id => @uploaded_file.id
   end

   should "destroy uploaded_file" do
     assert ! UploadedFile.exists?(@uploaded_file.id)
   end

   should_redirect_to "Admin::uploaded_file#index" do
     admin_uploaded_files_path
   end
  end
   
 end
end
