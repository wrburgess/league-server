class Admin::UsersController < AdminController
  protect_from_forgery

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end