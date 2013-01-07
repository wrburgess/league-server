class RosterSlot < ActiveRecord::Base
  attr_accessible :season, :week, :roster_id, :player_id

  validates_presence_of :season, :week, :roster_id

  belongs_to :roster
  belongs_to :player
end
