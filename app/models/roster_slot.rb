class RosterSlot < ActiveRecord::Base
  attr_accessible :season, :week, :roster_id, :player_id

  validates_presence_of :season, :week, :roster_id, :player_id, :roster_slot_type_id, :roster_slot_position_id

  belongs_to :roster
  belongs_to :player
  belongs_to :roster_slot_type
  belongs_to :roster_slot_position
end
