class RosterStatGame < ActiveRecord::Base
  validates_presence_of :roster_id, :season, :period

  belongs_to :roster
end