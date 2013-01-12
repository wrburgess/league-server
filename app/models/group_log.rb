class GroupLog < ActiveRecord::Base
  attr_accessible :transaction_id, :group_id, :roster_id, :player_id, :action, :group_owner, :note

  validates_presence_of :transaction_id, :group_id, :roster_id, :action

  belongs_to :group
  belongs_to :roster
  belongs_to :player
end