require 'test_helper'

class LyricsControllerTest < ActionController::TestCase
  context "Lyrics controller" do
  
    setup do
      @lyric = Factory(:lyric)
      @album = Factory(:album)
    end
   
    context "on GET to :show" do
       setup do
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
       should_assign_to :lyric
       should_render_template :index
     end
   end
end
