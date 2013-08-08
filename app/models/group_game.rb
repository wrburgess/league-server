class GroupGame < ActiveRecord::Base
  validates_presence_of :group_id, :season, :period, :counts
  validates_presence_of :away_roster, :home_roster

  belongs_to :group
  belongs_to :away_roster, class_name: "Roster"
  belongs_to :home_roster, class_name: "Roster"
end