class PlayersController < GroupsController

  def show
    @player = Player.find(params[:id])
  end

end