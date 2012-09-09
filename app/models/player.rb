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
