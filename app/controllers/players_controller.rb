class PlayersController < BrowserController

  def create
    player = Player.create!(player_params)
    redirect_to admin_player_path(player)
  end

  def update
    player = Player.find(params[:id])
    player.update_attributes!(player_params)
    redirect_to admin_player_path(player)
  end

  def destroy
    Player.find(params[:id]).destroy
    redirect_to admin_players_path
  end

  private

  def player_params
    params.require(:player).permit(:first_name, :last_name)
  end

end