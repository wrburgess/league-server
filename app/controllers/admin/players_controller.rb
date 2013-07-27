class Admin::PlayersController < AdminController

  def index
    @players = Player.all
  end

  def show
    @player = Player.find_by_id(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    player = Player.create!(player_params)
    flash[:notice] = "Player created."
    redirect_to admin_player_path(player)
  end

  def edit
    @player = Player.find_by_id(params[:id])
  end

  def update
    player = Player.find(params[:id])
    player.update_attributes!(player_params)
    flash[:notice] = "Player updated."
    redirect_to admin_player_path(player)
  end

  def destroy
    Player.find(params[:id]).destroy
    flash[:notice] = "Player deleted."
    redirect_to admin_players_path
  end

  private

  def player_params
    params.require(:player).permit(:first_name, :last_name, :player_team_id, :player_position_id)
  end

end