class GroupGameOpponent < ActiveRecord::Base
  validates_presence_of :group_game_id, :roster_id, :home_roster

  belongs_to :group_game
  belongs_to :roster

  scope :away_first, -> { order("home_roster ASC, roster_id ASC") }
end