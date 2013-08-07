class Admin::GroupsController < AdminController

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find_by_id(params[:id])
  end

  def edit
    @group = Group.find_by_id(params[:id])
  end

  def update
    group = Group.find(params[:id])
    group.update_attributes!(group_params)
    flash[:notice] = "#{AppSettings.group_alias.capitalize} updated"
    redirect_to admin_group_path(group)
  end

  private

  def group_params
    params.require(:group).permit(:name, :abbreviation)
  end

end