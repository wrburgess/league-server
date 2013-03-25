class Admin::TeamsController < AdminController
  protect_from_forgery

  def index
    @teams = Team.all

    @page_title = "Team Index"
    @body_id = "teams-index"
    @body_class = "page"
  end

end