class GroupsController < BrowserController

  def draft

  end

  def show

  end

  def standings

  end
  
  def schedule
    
  end

  def transactions
    @group_logs = @group.group_logs.includes(:player, :roster)
  end

end