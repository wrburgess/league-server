# == Schema Information
#
# Table name: group_users
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner      :boolean          default(FALSE)
#  viewer     :boolean          default(TRUE)
#

class GroupUser < ActiveRecord::Base
  attr_accessible :group_id, :user_id, :owner, :viewer

  validates_presence_of :group_id, :user_id
  validates_inclusion_of :owner, :in => [true, false]
  validates_inclusion_of :viewer, :in => [true, false]

  belongs_to :user
  belongs_to :group
end
