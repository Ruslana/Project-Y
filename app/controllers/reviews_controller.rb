class ReviewsController < ApplicationController
  
  def index
    @reviews = Review.all(:limit => 10, :order => 'created_at DESC')
    @reviews = Review.paginate :page => params[:page], :per_page => 5
  end
end
