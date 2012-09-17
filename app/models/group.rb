# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)      not null
#

class Group < ActiveRecord::Base
  attr_accessible :name

  validates_presence_of :name

  has_many :group_users
  has_many :users, :through => :group_users
end
