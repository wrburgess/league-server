class Admin::RostersController < AdminController

  def index
    @rosters = Roster.all
  end

  def show
    @roster = Roster.find_by_id(params[:id])
  end

  def edit
    @roster = Roster.find_by_id(params[:id])
  end

  def update
    roster = Roster.find(params[:id])
    roster.update_attributes!(roster_params)
    flash[:notice] = "#{AppSettings.app_alias_roster.capitalize} updated"
    redirect_to admin_roster_path(roster)
  end

  private

  def roster_params
    params.require(:roster).permit(:name, :abbreviation)
  end

end