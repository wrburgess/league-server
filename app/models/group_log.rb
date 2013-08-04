class GroupLog < ActiveRecord::Base

  validates_presence_of :group_id, :roster_id, :action

  belongs_to :group
  belongs_to :roster
  belongs_to :player
end