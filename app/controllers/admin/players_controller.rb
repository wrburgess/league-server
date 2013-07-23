class Admin::PlayersController < AdminController

  def index
    @players = Player.all
  end

  def show
    @player = Player.find_by_id(params[:id])
  end

  def edit
    @player = Player.find_by_id(params[:id])
  end

  def new
    @player = Player.new
  end

end