class Admin::UsersController < AdminController
  protect_from_forgery

  def index
    @users = User.all

    @page_title = "Users Index"
    @body_id = "users-index"
    @body_class = "page"
  end

  def show
    @user = User.find(params[:id])

    @page_title = "Users Show"
    @body_id = "users-show"
    @body_class = "page"
  end

end