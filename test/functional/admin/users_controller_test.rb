require File.dirname(__FILE__) + '/../../test_helper'

class Admin::UsersControllerTest < ActionController::TestCase
context "Admin Users controller" do

  setup do
   @user = Factory(:user)
   session[:user_id] = @user.id
  end

  context "on GET to :new" do
    setup do
      get :new
    end

    should_respond_with :success
    should_assign_to :user
    should_render_template :new
  end

  context "on POST to :create" do
    setup do
      post :create, :user => {:name => 'Rusya', 
                              :password => "12345",
                              :password_confirmation => "12345"
                              }
    end

    teardown do
      User.destroy_all
    end

    should_redirect_to "Admin::Users#index" do
      admin_users_path
    end

    should "create user" do
      assert User.exists?(:name => 'Rusya')
    end
  end

  context "on GET to :show" do
    setup do
      @user = Factory(:user)
      get :show, :id => @user.id
    end

    should_respond_with :success
    should_assign_to :user
    should_render_template :show
  end

  context "on GET :index" do
    setup do
      get :index
    end

    should_respond_with :success
    should_assign_to :users
    should_render_template :index
  end

  context "on GET to :edit" do
     setup do
       @user = Factory(:user)
       get :edit, :id => @user.id
     end

     should_respond_with :success
     should_assign_to :user
     should_render_template :edit
   end

   context "on PUT to :update" do
   setup do
     @user = Factory(:user, :name => "old")
     put :update, :id => @user.id, :user => {:name => "new"}
   end

   should_redirect_to "Admin::User#show" do
     admin_user_path(@user)
   end

   should "update user" do
     @user.reload
     assert_equal "new", @user.name
   end
 end

  context "on DELETE to :destroy" do
    setup do
      @user = Factory(:user)
      delete :destroy, :id => @user.id
    end

    should "destroy user" do
      assert ! User.exists?(@user.id)
    end

    should_redirect_to "Admin::User#index" do
      admin_users_path
    end
  end

end

end
