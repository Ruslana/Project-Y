require 'test_helper'

class Admin::AlbumsControllerTest < ActionController::TestCase
  context "Admin Albums controller" do

     setup do
      @album = Factory(:album)
     end

     context "on GET to :new" do
       setup do
         get :new
       end

       should_respond_with :success
       should_assign_to :album
       should_render_template :new
       should_render_a_form
     end

     context "on POST to :create" do
       setup do
         post :create, :album => {:title => 'album'}
       end

       teardown do
         Post.destroy_all
       end

       should_redirect_to "Admin::Albums#show" do
         admin_post_path(Album.first)
       end

       should "create album" do
         assert Album.exists?(:title => 'album')
       end
     end

     context "on GET to :show" do
       setup do
         get :show, :id => @album.id
       end

       should_respond_with :success
       should_assign_to :album
       should_assign_to :lyrics
       should_render_template :show
     end

     context "on GET :index" do
       setup do
         get :index
       end

       should_respond_with :success
       should_assign_to :albums
       should_render_template :index
     end

     context "on GET to :edit" do
        setup do
          get :edit, :id => @album.id
        end

        should_respond_with :success
        should_assign_to :album
        should_render_template :edit
        should_render_a_form
      end

      context "on PUT to :update" do
      setup do
        @post = Factory(:album, :title => "old")
        put :update, :id => @album.id, :album => {:title => "new"}
      end

      should_redirect_to "Admin::Album#show" do
        admin_post_path(@album)
      end

      should "update album" do
        @album.reload
        assert_equal "new", @album.title
      end
    end

     context "on DELETE to :destroy" do
       setup do
         delete :destroy, :id => @album.id
       end

       should "destroy album" do
         assert ! Album.exists?(@album.id)
       end

       should_redirect_to "Admin::Album#index" do
         admin_posts_path
       end
     end

   end
  
end
