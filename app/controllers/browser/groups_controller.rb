class Browser::GroupsController < BrowserController
  protect_from_forgery

  def index
    @groups = Group.find(params[:id])

    @page_title = "League Home"
    @body_id = "league_home"
    @body_class = "page"
  end

end