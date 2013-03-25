class Admin::StaticController < AdminController
  protect_from_forgery

  def index
    @page_title = "Main Menu"
    @body_id = "admin_menu"
    @body_class = "page"
  end

end