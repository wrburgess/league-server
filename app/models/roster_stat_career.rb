class GroupStatCareer < ActiveRecord::Base
  attr_accessible :group_id
  attr_accessible :wins, :losses, :ties, :points_for, :points_against
  attr_accessible :playoff_wins, :playoff_losses, :playoff_ties
  attr_accessible :champ_wins, :champ_losses, :champ_ties

  validates_presence_of :group_id, :season

  belongs_to :group
end