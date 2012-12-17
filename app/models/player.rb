class Player < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :team_id

  validates :first_name, :last_name, :team_id, presence: true

  belongs_to :team
  has_many :game_stats
  has_many :season_stats
  has_one :career_stat

  def full_name
    "#{first_name} #{last_name}"
  end

end
