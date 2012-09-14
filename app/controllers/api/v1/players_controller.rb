class Api::V1::PlayersController < ApiController

  def index
    @players = Player.all

    response.headers["X-LS-Records-Returned"] = "#{@players.count}"
    response.headers["X-LS-License"] = "All Rights Reserved"
  end

  def show

  end

  def create

  end

  def update

  end

end