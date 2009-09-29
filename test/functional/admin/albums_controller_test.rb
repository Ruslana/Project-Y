require File.dirname(__FILE__) + '/../../test_helper'

class Admin::AlbumsControllerTest < ActionController::TestCase
  context "Admin Albums controller" do
    
    setup do
      @user = Factory(:user)
      session[:user_id] = @user.id
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
         post :create, :album => {:title => 'album', :description => 'description'}
       end

       teardown do
         Album.destroy_all
       end

       should_redirect_to "Admin::Albums#show" do
         Album.create!(:title => 'album', :description => 'description')
         admin_album_path(Album.first)
       end

       should "create album" do
         assert Album.exists?(:title => 'album')
       end
     end

     context "on GET to :show" do
       setup do
         @album = Factory(:album)
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
          @album = Factory(:album)
          get :edit, :id => @album.id
        end

        should_respond_with :success
        should_assign_to :album
        should_render_template :edit
        should_render_a_form
      end

      context "on PUT to :update" do
      setup do
        @album = Factory(:album, :title => "old", :description => "description")
        put :update, :id => @album.id, :album => {:title => "new", :description => "des"}
      end

      should_redirect_to "Admin::Album#show" do
        admin_album_path(@album)
      end

      should "update album" do
        @album.reload
        assert_equal "new", @album.title
        assert_equal "des", @album.description
      end
    end

     context "on DELETE to :destroy" do
       setup do
         @album = Factory(:album)
         delete :destroy, :id => @album.id
       end

       should "destroy album" do
         assert ! Album.exists?(@album.id)
       end

       should_redirect_to "Admin::Album#index" do
         admin_albums_path
       end
     end
   end  
end
