FactoryGirl.define do
  factory :group_games do
    group
    season 2013
    period 1
    counts true
    away_roster_score_adjustment 0
    away_roster_score 0
    away_roster
    home_roster_score_adjustment 0
    home_roster_score 0
    home_roster
  end
end