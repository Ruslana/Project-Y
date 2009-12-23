class Admin::UsersController < ProtectedController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.save
    redirect_to admin_users_path
  end

  def index
    @users = User.find(:all)
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user = User.update_attributes(params[:user])
      redirect_to admin_user_path(@user)
    else
      redirect_to :action => 'edit'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end
end
