class GroupGame < ActiveRecord::Base

  validates_presence_of :group_id, :season, :period, :counts

  belongs_to :group
  belongs_to :away_roster, as: "Roster"
  belongs_to :home_roster, as: "Roster"

end