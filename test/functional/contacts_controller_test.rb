require File.dirname(__FILE__) + '/../test_helper'

class ContactsControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  context "Controller Contacts" do
    setup do
      @album = Factory(:album)
     end

    context "on GET :index" do
      setup do
        get :index
      end

      should_respond_with :success
      should_assign_to :contacts
      should_render_template :index
    end
  end
end
