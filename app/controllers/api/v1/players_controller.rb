class Api::V1::PlayersController < ApiController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_filter :require_token
  after_filter :response_header

  def index
    @players = Player.all

    response.headers["X-LS-Records-Returned"] = "#{@players.count}"
  end

  def show
    @player = Player.where(id: params[:id])

    response.headers["X-LS-Records-Returned"] = "#{@player.count}"
  end

  def create

  end

  def update

  end

  def destroy

  end

  private

  def require_token
    authenticate_with_http_token do |token, options|
      #@current_user = Token.find_by_key(key).account if Token.exists?(key: key)
      head :unauthorized unless token == "XXX"
    end
  end

  def response_header
    response.headers["X-LS-Application"] = Settings.app.name
    response.headers["X-LS-License"] = Settings.app.license
  end

end