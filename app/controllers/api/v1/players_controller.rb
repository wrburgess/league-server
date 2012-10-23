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
    player = {
      first_name: params[:player][:first_name],
      last_name: params[:player][:last_name],
      team_id: params[:player][:team_id]
    }

    @player = Player.create!(player)
    record_count = Player.where(id: @player.id).count

    response.headers["X-LS-Records-Returned"] = "#{record_count}" if @player
  end

  def update
    player = {
      first_name: params[:player][:first_name],
      last_name: params[:player][:last_name],
      team_id: params[:player][:team_id]
    }

    @player = Player.find params[:id]
    @player.update!(player)
    record_count = Player.where(id: @player.id).count

    response.headers["X-LS-Records-Returned"] = "#{record_count}" if @player
  end

  def destroy
    player = Player.find params[:id]
    player.delete

    response.headers["X-LS-Records-Returned"] = "0"
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