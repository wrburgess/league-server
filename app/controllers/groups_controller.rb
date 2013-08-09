class GroupsController < BrowserController

  def draft

  end

  def show

  end

  def standings

  end
  
  def games
    @group_games = @group.group_games.where(season: 2013)
  end

  def transactions
    @group_logs = @group.group_logs.includes(:player, :roster)
  end

end