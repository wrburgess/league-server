class GroupsController < BrowserController

  def draft

  end

  def show

  end

  def standings
    rosters = @group.rosters
    @group_divisions = rosters.group_by { |roster| roster.group_divisions.first.id }
  end
  
  def games
    group_games = GroupGame.where(group: @group, season: AppSettings.app_season)
    @periods = group_games.group_by { |group_game| group_game.period }
  end

  def transactions
    @group_logs = @group.group_logs.includes(:player, :roster)
  end

end