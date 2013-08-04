class RostersController < BrowserController

  def show
    @roster = Roster.find(params[:id])
  end

  def index
    @group = Group.find(params[:group_id])
    @rosters = @group.rosters
  end

end