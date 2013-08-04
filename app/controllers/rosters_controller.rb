class RostersController < BrowserController

  def show
    @roster = Roster.find(1)
  end

  def index
    @rosters = Roster.where(group_id: params[:group_id])
  end

end