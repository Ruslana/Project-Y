require File.dirname(__FILE__) + '/../../test_helper'

class Admin::LyricsControllerTest < ActionController::TestCase
  context "Admin Lyrics controller" do
    
    setup do
      @album = Factory(:album)
      @user = Factory(:user)
      session[:user_id] = @user.id
    end

     context "on POST to :create" do
       setup do
         post :create, :lyric => {
           :title => 'title', 
           :text_song => 'text_song', 
           :album_id => @album.id
           }
       end

       teardown do
         Lyric.destroy_all
       end

       should_redirect_to "Admin::Lyric#index" do
         admin_lyrics_path
       end

       should "create lyric" do
         assert Lyric.exists?(:title => 'title')
       end
     end

     context "on GET to :show" do
       setup do
         @lyric = Factory(:lyric)
         get :show, :id => @lyric.id
       end

       should_respond_with :success
       should_assign_to :lyric
       should_render_template :show
     end

     context "on GET :index" do
       setup do
         get :index
       end

       should_respond_with :success
       should_assign_to :lyrics
       should_render_template :index
     end

     context "on GET to :edit" do
        setup do
          @lyric = Factory(:lyric)
          get :edit, :id => @lyric.id
        end

        should_respond_with :success
        should_assign_to :lyric
        should_render_template :edit
        should_render_a_form
      end

      context "on PUT to :update" do
      setup do
        @lyric = Factory(:lyric, :title => "old")
        put :update, :id => @lyric.id, :lyric => {:title => "new"}
      end

      should_redirect_to "Admin::Lyric#show" do
        admin_lyric_path(@lyric)
      end

      should "update lyric" do
        @lyric.reload
        assert_equal "new", @lyric.title
      end
    end

     context "on DELETE to :destroy" do
       setup do
         @lyric = Factory(:lyric)
         delete :destroy, :id => @lyric.id
       end

       should "destroy lyric" do
         assert ! Lyric.exists?(@lyric.id)
       end

       should_redirect_to "Admin::Lyric#index" do
         admin_lyrics_path
       end
     end

   end
  
end
