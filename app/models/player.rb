class Player < ActiveRecord::Base

  validates :first_name, :last_name, :player_team_id, :player_position_id, presence: true

  has_many :player_stat_games
  has_many :player_stat_seasons
  has_one :player_stat_career
  has_many :group_logs

  belongs_to :player_team
  belongs_to :player_position
  has_many :group_player_teams, :through => :player_team
  has_many :groups, :through => :group_player_teams

  has_many :roster_slots
  has_many :rosters, :through => :roster_slots

  def full_name
    "#{first_name} #{last_name}"
  end
  
end
