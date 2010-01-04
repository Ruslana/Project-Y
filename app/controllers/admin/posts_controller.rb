class Admin::PostsController < ProtectedController
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Post created"
      redirect_to admin_post_path(@post)
    else
      render new_admin_post_path
    end
  end
    
  def show
    @post = Post.find(params[:id])
  end
  
  def index
    @posts = Post.paginate :page => params[:page], :per_page => 3, :order => "created_at DESC"
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to admin_post_path(@post)
    else
      redirect_to edit_admin_post_path(@post)
    end
  end
  
  def destroy
     @post = Post.find(params[:id])
     @post.destroy
     redirect_to admin_posts_path
   end
   
end

