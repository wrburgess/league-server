class RostersController < BrowserController
  protect_from_forgery

  def show
    @roster = Roster.find(1)

    @page_title = "My Team"
    @body_id = "roster_show"
    @body_class = "page"
  end

  def index

  end

end