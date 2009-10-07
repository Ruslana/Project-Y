require File.dirname(__FILE__) + '/../../test_helper'

class Admin::UploadsControllerTest < ActionController::TestCase
  context "Admin Uploads controller" do

    setup do
      @album = Factory(:album)
      @user = Factory(:user)
      session[:user_id] = @user.id
    end

    context "on GET to :new" do
      setup do
        get :new
      end

     should_respond_with :success
     should_assign_to :upload
     should_render_template :new
     should_render_a_form
    end

   context "on POST to :create" do
     setup do
       post :create, :upload => {:name => 'name', :size => '11', :file_name => 'file_name'}
     end

     teardown do
       Upload.destroy_all
     end

     should_redirect_to "Admin::Upload#show" do
       admin_upload_path(Upload.first)
     end

     should "create upload" do
       assert Upload.exists?(:file_name => 'file_name')
     end
   end

   context "on GET to :show" do
     setup do
       @upload = Factory(:upload)
       get :show, :id => @upload.id
     end

     should_respond_with :success
     should_assign_to :upload
     should_render_template :show
   end
=begin
   context "on GET :index" do
     setup do
       get :index
     end

     should_respond_with :success
     should_assign_to :posts
     should_render_template :index
   end

   context "on GET to :edit" do
      setup do
        @post = Factory(:post)
        get :edit, :id => @post.id
      end

      should_respond_with :success
      should_assign_to :post
      should_render_template :edit
      should_render_a_form
    end

    context "on PUT to :update" do
    setup do
      @post = Factory(:post, :title => "old", :body => "old")
      put :update, :id => @post.id, :post => {:title => "new", :body => "new"}
    end

    should_redirect_to "Admin::Post#show" do
      admin_post_path(@post)
    end

    should "update post" do
      @post.reload
      assert_equal "new", @post.title
      assert_equal "new", @post.body
    end
  end

   context "on DELETE to :destroy" do
     setup do
       @post = Factory(:post)
       delete :destroy, :id => @post.id
     end

     should "destroy post" do
       assert ! Post.exists?(@post.id)
     end

     should_redirect_to "Admin::Post#index" do
       admin_posts_path
     end
   end
=end
   end
end
