require 'test_helper'

class Admin::ReviewsControllerTest < ActionController::TestCase
  context "Admin reviews controller" do

     setup do
      @album = Factory(:album)
      @review = Factory(:review)
     end

     context "on GET to :new" do
       setup do
         get :new
       end

       should_respond_with :success
       should_assign_to :review
       should_render_template :new
       should_render_a_form
     end

     context "on review to :create" do
       setup do
         post :create, :review => {:title => 'review', :body => 'body_review', :date => Date.new(2009,6,25), :author => "author"}
       end

       teardown do
         Review.destroy_all
       end

       should_redirect_to "Admin::reviews#show" do
         admin_review_path(@review)
       end

       should "create review" do
         assert Review.exists?(:title => 'review')
       end
     end

     context "on GET to :show" do
       setup do
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
          get :edit, :id => @review.id
        end

        should_respond_with :success
        should_assign_to :review
        should_render_template :edit
        should_render_a_form
      end

      context "on PUT to :update" do
      setup do
        @review = Factory(:review, :title => "old", :body => "old", :date => '1.1.1', :author => "Thomas")
        put :update, :id => @review.id, :review => {:title => "new", :body => "new", :date => '2.2.2', :author => "Max"}
      end

      should_redirect_to "Admin::review#show" do
        admin_review_path(@review)
      end

      should "update review" do
        @review.reload
        assert_equal "new", @review.title
        assert_equal "new", @review.body
        assert_equal '2.2.2', @review.date
        assert_equal "Max", @review.author
      end
    end

     context "on DELETE to :destroy" do
       setup do
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
