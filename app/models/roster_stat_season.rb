class RosterStatSeason < ActiveRecord::Base
  # attr_accessible :roster_id, :season
  # attr_accessible :wins, :losses, :ties, :points_for, :points_against
  # attr_accessible :playoff_wins, :playoff_losses, :playoff_ties
  # attr_accessible :champ_wins, :champ_losses, :champ_ties

  validates_presence_of :roster_id, :season

  belongs_to :roster
end