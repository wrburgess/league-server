class Browser::GroupsController < BrowserController
  protect_from_forgery

  def index
    @groups = Group.all

    @page_title = "League List"
    @body_id = "league_index"
    @body_class = "page"
  end

  def show
    @group = Group.find(params[:id])

    @page_title = "League Home"
    @body_id = "league_show"
    @body_class = "page"
  end

end