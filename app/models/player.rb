class Player < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :player_team_id

  validates :first_name, :last_name, :player_team_id, presence: true

  has_many :player_stat_games
  has_many :player_stat_seasons
  has_one :player_stat_career
  has_many :group_logs

  belongs_to :player_team
  has_many :group_player_teams, :through => :player_team
  has_many :groups, :through => :group_player_teams

  def full_name
    "#{first_name} #{last_name}"
  end
end
