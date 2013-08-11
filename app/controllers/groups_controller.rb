class GroupsController < BrowserController

  def standings
    rosters = @group.rosters
    @group_divisions = rosters.group_by { |roster| roster.group_divisions.first.name }
  end

  def transactions
    @group_logs = @group.group_logs.includes(:player, :roster)
  end

end