class Player < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :player_team_id

  validates :first_name, :last_name, :player_team_id, presence: true

  belongs_to :player_team
  has_many :player_stat_games
  has_many :player_stat_seasons
  has_one :player_stat_career

  def full_name
    "#{first_name} #{last_name}"
  end
end
