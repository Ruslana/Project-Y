require File.dirname(__FILE__) + '/../../test_helper'

class Admin::ReviewsControllerTest < ActionController::TestCase
  context "Admin reviews controller" do

     setup do
      @user = Factory(:user)
      session[:user_id] = @user.id
     end

     context "on GET to :new" do
       setup do
         get :new
       end

       should_respond_with :success
       should_assign_to :review
       should_render_template :new
     end

     context "on POST to :create" do
       setup do
         post :create, :review => {:title => 'review', 
                                   :body => 'body_review', 
                                   :date => Date.new(2009,6,25), 
                                   :author => "author"}
       end

       teardown do
         Review.destroy_all
       end

       should_redirect_to "Admin::reviews#show" do
         admin_review_path(Review.first)
       end

       should "create review" do
         assert Review.exists?(:title => 'review')
       end
     end

     context "on GET to :show" do
       setup do
         @review = Factory(:review)
         get :show, :id => @review.id
       end

       should_respond_with :success
       should_assign_to :review
       should_render_template :show
     end

     context "on GET :index" do
       setup do
         get :index
       end

       should_respond_with :success
       should_assign_to :reviews
       should_render_template :index
     end

     context "on GET to :edit" do
        setup do
          @review = Factory(:review)
          get :edit, :id => @review.id
        end

        should_respond_with :success
        should_assign_to :review
        should_render_template :edit
      end

      context "on PUT to :update" do
      setup do
        @review = Factory(:review, :title => "old", 
                                   :body => "old"
                                   )
        put :update, :id => @review.id, :review => {:title => "new", 
                                                    :body => "new" 
                                                    }
      end

      should_redirect_to "Admin::review#show" do
        admin_review_path(@review)
      end

      should "update review" do
        @review.reload
        assert_equal "new", @review.title
        assert_equal "new", @review.body
      end
    end

     context "on DELETE to :destroy" do
       setup do
         @review = Factory(:review)
         delete :destroy, :id => @review.id
       end

       should "destroy review" do
         assert ! Review.exists?(@review.id)
       end

       should_redirect_to "Admin::review#index" do
         admin_reviews_path
       end
     end

   end
  
end
