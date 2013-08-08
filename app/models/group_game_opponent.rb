class GroupGameOpponent < ActiveRecord::Base
  validates_presence_of :group_game_id, :roster_id, :home_roster

  belongs_to :group_game
  belongs_to :roster
end