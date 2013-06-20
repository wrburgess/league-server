class BrowserController < ApplicationController
  layout "browser"

  before_filter :set_constants
  before_filter :load_group_and_roster

  private

  def set_constants
    @group_id = params[:group_id]
  end

  def load_group_and_roster
    @group = Group.find(params[:group_id]) || 5
    @roster = Roster.find(params[:roster_id]) || 3
  end

end