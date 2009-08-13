class Admin::PostsController < ProtectedController
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Заметка создана"
      redirect_to admin_post_path(@post)
    else
      flash[:notice] = "Извините, заметка не создана"
      render new_admin_post_path
    end
  end
    
  def show
    @post = Post.find(params[:id])
  end
  
  def index
    @posts = Post.paginate :page => params[:page], :per_page => 3
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to admin_post_path(@post)
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

