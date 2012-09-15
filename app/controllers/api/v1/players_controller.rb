class Api::V1::PlayersController < ApiController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_filter :require_token

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

  private

  def require_token
    authenticate_with_http_token do |token, options|
      #@current_user = Token.find_by_key(key).account if Token.exists?(key: key)
      head :unauthorized unless token == "XXX"
    end
  end

end