class Browser::GroupsController < BrowserController
  protect_from_forgery

  def draft

    @page_title = "Draft Room"
    @body_id = "group_draft"
    @body_class = "page"
  end

  def index
    @groups = Group.all

    @page_title = "Leagues"
    @body_id = "group_index"
    @body_class = "page"
  end

  def show
    @group = Group.find(params[:id])

    @page_title = "Home"
    @body_id = "group_show"
    @body_class = "page"
  end

  def standings

    @page_title = "Standings"
    @body_id = "standings"
    @body_class = "page"
  end

  def transactions

    @page_title = "Transactions"
    @body_id = "transactions"
    @body_class = "page"
  end

end