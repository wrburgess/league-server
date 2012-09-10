class RosterUser < ActiveRecord::Base
  attr_accessible :roster_id, :user_id

  validates_presence_of :roster_id, :user_id

  belongs_to :users
  belongs_to :groups
end
