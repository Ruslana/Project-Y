require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  context "Controller Contacts" do
    setup do
      @album = Factory(:album)
     end
     
    context "on POST to :create" do
      setup do
        post :create, :contact => {:your_name => 'name', 
                                   :your_email => 'email',
                                   :your_message => 'message'
                                   }
      end

      teardown do
        Contact.destroy_all
      end

      should_redirect_to "Contacts#index" do
        contacts_path
      end

      should "create contact" do
        assert Contact.exists?(:your_name => 'name')
      end
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
