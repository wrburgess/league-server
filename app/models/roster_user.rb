class RosterUser < ActiveRecord::Base
  attr_accessible :roster_id, :user_id, :founder, :owner, :viewer

  validates_presence_of :roster_id, :user_id
  validates_inclusion_of :founder, :in => [true, false]
  validates_inclusion_of :owner, :in => [true, false]
  validates_inclusion_of :viewer, :in => [true, false]

  belongs_to :user
  belongs_to :roster
end
