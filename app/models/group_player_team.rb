class GroupPlayerTeam < ActiveRecord::Base
  attr_accessible :group_id, :player_team_id

  validates_presence_of :group_id, :player_team_id

  belongs_to :player_team
  belongs_to :group
end