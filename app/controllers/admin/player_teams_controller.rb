class Admin::PlayerTeamsController < AdminController

  def index
    @player_teams = PlayerTeam.all
  end

  def show
    @player_team = PlayerTeam.find_by_id(params[:id])
  end

  def new
    @player_team = PlayerTeam.new
  end

  def create
    player_team = PlayerTeam.create!(player_team_params)
    flash[:notice] = "School created"
    redirect_to admin_player_team_path(player_team)
  end

  def edit
    @player_team = PlayerTeam.find_by_id(params[:id])
  end

  def update
    player_team = PlayerTeam.find(params[:id])
    player_team.update_attributes!(player_team_params)
    flash[:notice] = "School updated"
    redirect_to admin_player_team_path(player_team)
  end

  def destroy
    PlayerTeam.find(params[:id]).destroy
    flash[:notice] = "School deleted"
    redirect_to admin_player_teams_path
  end

  private

  def player_team_params
    params.require(:player_team).permit(:location_name, :nickname, :abbreviation, :player_conference_id)
  end

end