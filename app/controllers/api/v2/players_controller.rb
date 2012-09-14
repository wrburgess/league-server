class Api::V2::PlayersController < ApiController
  respond_to :json

  def index
    respond_with Player.find_by_id(1)
  end

  def show

  end

  def create

  end

  def update

  end

end