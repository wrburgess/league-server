class RostersController < BrowserController

  def show
    @roster = Roster.find(params[:id])
    @roster_slots = @roster.roster_slots.where(season: 2013, period: 1)
  end

  def index
    @group = Group.find(params[:group_id])
    @rosters = @group.rosters
  end

end