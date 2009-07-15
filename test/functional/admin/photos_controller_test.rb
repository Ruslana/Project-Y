require 'test_helper'

class Admin::PhotosControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  context "Admin photos controller" do
    setup do
      @album = Factory(:album)
    end
    
    context "on GET to :new" do
       setup do
         get :new
       end

       should_respond_with :success
       should_assign_to :photo
       should_render_template :new
       should_render_a_form
     end

     context "on POST to :create" do
       setup do
         post :create, :photo => {:name => 'name'}
       end

       teardown do
         Photo.destroy_all
       end

       should_redirect_to "Admin::Photos#show" do
         admin_photo_path(Photo.first)
       end

       should "create photo" do
         assert Photo.exists?(:name => 'name')
       end
     end
  end
  
end
