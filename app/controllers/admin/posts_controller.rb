class Admin::PostsController < ProtectedController
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save!
      redirect_to admin_post_path(@post)
    else
      render new_admin_post_path
    end
  end
    
  def show
    @post = Post.find(params[:id])
  end
  
  def index
    @posts = Post.all(:limit => 10, :order => 'created_at DESC')
    @posts = Post.paginate :page => params[:page], :per_page => 3
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to admin_posts_path
    else
      redirect_to :action => 'edit'
    end
  end
  
  def destroy
     @post = Post.find(params[:id])
     @post.destroy
     redirect_to :action => 'index'
   end
end

