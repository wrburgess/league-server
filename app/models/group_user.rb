class GroupUser < ActiveRecord::Base
  attr_accessible :group_id, :user_id, :owner, :viewer

  validates_presence_of :group_id, :user_id
  validates_inclusion_of :owner, :in => [true, false]
  validates_inclusion_of :viewer, :in => [true, false]

  belongs_to :user
  belongs_to :group
end
