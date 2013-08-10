class GroupsController < BrowserController

  def draft

  end

  def show

  end

  def standings
    @rosters = @group.rosters
  end
  
  def games
    @group_games = @group.group_games.where(season: AppSettings.app_season)
  end

  def transactions
    @group_logs = @group.group_logs.includes(:player, :roster)
  end

end