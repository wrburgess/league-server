# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  team_id    :integer
#

class Player < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :team_id

  validates_presence_of :first_name, :last_name, :team_id

  belongs_to :team
  has_many :game_stats
  has_many :season_stats
  has_one :career_stat

  def full_name
    "#{first_name} #{last_name}"
  end

end
