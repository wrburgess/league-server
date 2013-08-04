class Admin::PlayerConferencesController < AdminController

  def index
    @player_conferences = PlayerConference.all
  end

  def show
    @player_conference = PlayerConference.find_by_id(params[:id])
  end

  def new
    @player_conference = PlayerConference.new
  end

  def create
    player_conference = PlayerConference.create!(player_conference_params)
    flash[:notice] = "Player created"
    redirect_to admin_player_path(player)
  end

  def edit
    @player = PlayerConference.find_by_id(params[:id])
  end

  def update
    player_conference = PlayerConference.find(params[:id])
    player_conference.update_attributes!(player_conference_params)
    flash[:notice] = "Player updated"
    redirect_to admin_player_conference_path(player_conference)
  end

  def destroy
    PlayerConference.find(params[:id]).destroy
    flash[:notice] = "Player Conference deleted"
    redirect_to admin_player_conferences_path
  end

  private

  def player_conference_params
    params.require(:player_conference).permit(:name, :abbreviation)
  end

end