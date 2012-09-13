class UsersController < ApplicationController
  protect_from_forgery

  def index
    @users = User.all

    @page_title = "Users Index"
    @body_id = "users-index"
    @body_class = "page"
  end

end