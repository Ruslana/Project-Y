require File.dirname(__FILE__) + '/../../test_helper'

class Admin::ContactsControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  context "Admin Contacts controller" do
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
        should_assign_to :contact
        should_render_template :new
        should_render_a_form
      end

      context "on POST to :create" do
        setup do
          post :create, :contact => {:some_contact => 'contact' }
        end

        teardown do
          Contact.destroy_all
        end

        should_redirect_to "Admin::Contacts#show" do
          admin_contact_path(Contact.first)
        end

        should "create contact" do
          assert Contact.exists?(:some_contact => 'contact')
        end
      end

      context "on GET to :show" do
        setup do
          @contact = Factory(:contact)
          get :show, :id => @contact.id
        end

        should_respond_with :success
        should_assign_to :contact
        should_render_template :show
      end

      context "on GET :index" do
        setup do
          get :index
        end

        should_respond_with :success
        should_assign_to :contacts
        should_render_template :index
      end

      context "on GET to :edit" do
         setup do
           @contact = Factory(:contact)
           get :edit, :id => @contact.id
         end

         should_respond_with :success
         should_assign_to :contact
         should_render_template :edit
         should_render_a_form
       end

       context "on PUT to :update" do
       setup do
         @contact = Factory(:contact, :some_contact => "old_contact")
         put :update, :id => @contact.id, :contact => {:some_contact => "new_contact"}
       end

       should_redirect_to "Admin::Contacts#show" do
         admin_contact_path(@contact)
       end

       should "update contact" do
         @contact.reload
         assert_equal "new_contact", @contact.some_contact
       end
     end

      context "on DELETE to :destroy" do
        setup do
          @contact = Factory(:contact)
          delete :destroy, :id => @contact.id
        end

        should "destroy contact" do
          assert ! Contact.exists?(@contact.id)
        end

        should_redirect_to "Admin::Contacts#index" do
          admin_contacts_path
        end
      end
     
  end
end
