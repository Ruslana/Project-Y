require File.dirname(__FILE__) + '/../test_helper'

class MessagesControllerTest < ActionController::TestCase
  context "Controller Message" do
    setup do
      @album = Factory(:album)
    end
    
    context "on POST to :create" do
      setup do
        post :create, :message => {:your_name => 'Koka', :your_email => 'kokin@mail', :your_message => 'bum'}
      end
      
      teardown do
        Message.destroy_all
      end
      
      should "create message" do
        assert Message.exists?(:your_name => 'Koka')
      end
      
      should_redirect_to "Contacts#index" do
        contacts_path
      end
    end
  
  end  
end
