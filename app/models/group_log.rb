class GroupLog < ActiveRecord::Base
  attr_accessible :transaction_id, :group_id, :roster_id, :player_id, :action

  validates_presence_of :transaction_id, :group_id, :roster_id, :player_id, :action

  belongs_to :group
  belongs_to :roster
  belongs_to :player
end