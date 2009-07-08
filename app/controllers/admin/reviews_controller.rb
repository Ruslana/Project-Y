class Admin::ReviewsController < ProtectedController
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(params[:review])
    if @review.save!
      redirect_to admin_review_path(@review)
    else
      render new_admin_review_path
    end
  end
    
  def show
    @review = Review.find(params[:id])
  end
  
  def index
    @reviews = Review.all(:limit => 10, :order => 'created_at DESC')
    @reviews = Review.paginate :page => params[:page], :per_page => 3
  end
  
  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(params[:review])
      redirect_to admin_review_path(@review)
    else
      redirect_to :action => 'edit'
    end
  end
  
  def destroy
     @review = Review.find(params[:id])
     @review.destroy
     redirect_to :action => 'index'
   end
end
