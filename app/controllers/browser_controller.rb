class BrowserController < ApplicationController
  layout "browser"

  before_filter :load_group_and_roster

  private

  def load_group_and_roster
    @group = Group.find(params[:group_id]) || 5
    @roster = Roster.find(1)
  end

end