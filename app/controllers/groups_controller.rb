class GroupsController < BrowserController

  def draft
    @group = Group.find(params[:group_id])
  end

  def show
    @group = Group.find(params[:group_id])
  end

  def standings
    @group = Group.find(params[:group_id])
  end

  def transactions
    @group = Group.find(params[:group_id])
  end

end