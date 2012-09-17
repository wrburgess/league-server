# == Schema Information
#
# Table name: teams
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  location_name :string(255)
#  nickname      :string(255)
#  abbreviation  :string(255)
#

class Team < ActiveRecord::Base
  attr_accessible :location_name, :nickname, :abbreviation

  validates_presence_of :location_name, :nickname, :abbreviation

  has_many :players

  def full_name
    "#{location_name} #{nickname}"
  end

end
