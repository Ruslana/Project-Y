require File.dirname(__FILE__) + '/../test_helper'

class AlbumsControllerTest < ActionController::TestCase
  setup do
    @album = Factory(:album)
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
 
end
