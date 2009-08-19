class ReviewsController < ApplicationController
  
  def index
    @reviews = Review.paginate :page => params[:page], :per_page => 5
  end
  
end
