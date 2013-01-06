class RosterStatGame < ActiveRecord::Base
  attr_accessible :roster_id, :season, :game_id
  attr_accessible :win, :loss, :tie, :points_for, :points_against
  attr_accessible :playoff_win, :playoff_loss, :playoff_tie
  attr_accessible :champ_win, :champ_loss, :champ_tie

  validates_presence_of :roster_id, :season, :game_id

  belongs_to :roster
end