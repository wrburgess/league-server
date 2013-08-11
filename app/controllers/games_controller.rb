class GamesController < BrowserController

  def index
    group_games = GroupGame.where(group: @group, season: AppSettings.app_season)
    @periods = group_games.group_by { |group_game| group_game.period }
  end

  def show

  end

end