# == Schema Information
#
# Table name: rosters
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  abbreviation :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Roster < ActiveRecord::Base
  attr_accessible :abbreviation, :name

  validates_presence_of :name

  has_many :roster_users
  has_many :users, :through => :roster_users
end
