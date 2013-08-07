class Admin::TeamsController < AdminController
  protect_from_forgery

  def index
    @teams = Team.all
  end

end