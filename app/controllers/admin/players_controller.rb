class Admin::PlayersController < AdminController
  protect_from_forgery

  def index
    @players = Player.all

    @page_title = "Players Index"
    @body_id = "players-index"
    @body_class = "page"
  end

  def show
    @player = Player.find_by_id(params[:id])

    @page_title = "Player Show"
    @body_id = "players-show"
    @body_class = "page"
  end

end