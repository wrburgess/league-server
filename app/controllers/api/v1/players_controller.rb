class Api::V1::PlayersController < ApiController
  respond_to :json

  def index
    respond_with Player.all
  end

  def show

  end

  def create

  end

  def update

  end

end