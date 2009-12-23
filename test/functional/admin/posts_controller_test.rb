require File.dirname(__FILE__) + '/../../test_helper'

class Admin::PostsControllerTest < ActionController::TestCase
  context "Admin Posts controller" do

     setup do
      @user = Factory(:user)
      session[:user_id] = @user.id
     end

     context "on GET to :new" do
       setup do
         get :new
       end

       should_respond_with :success
       should_assign_to :post
       should_render_template :new
     end

     context "on POST to :create" do
       setup do
         post :create, :post => {:title => 'post', 
                                 :body => 'body_post',
                                 :published_at => Date.new(2009,6,25)}
       end

       teardown do
         Post.destroy_all
       end

       should_redirect_to "Admin::Posts#show" do
         admin_post_path(Post.first)
       end

       should "create post" do
         assert Post.exists?(:title => 'post')
       end
     end

     context "on GET to :show" do
       setup do
         @post = Factory(:post)
         get :show, :id => @post.id
       end

       should_respond_with :success
       should_assign_to :post
       should_render_template :show
     end

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

   end
  
end
