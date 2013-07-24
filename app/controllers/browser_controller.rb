class BrowserController < ApplicationController
  layout "browser"

  before_filter :load_group_and_roster

  private

  def load_group_and_roster
    # group_id = params[:group_id] || 5
    # @group = Group.find(group_id)

    # roster_id = params[:roster_id] || 1
    # @roster = Roster.find(roster_id)
  end

end