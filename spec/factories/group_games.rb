FactoryGirl.define do
  factory :away_roster, :class => "Roster" do
    name "Lake View Fielders"
    abbreviation "LAKE"
  end

  factory :home_roster, :class => "Roster" do
    name "Fairfax Pit Bulls"
    abbreviation "FFX"
  end

  factory :group_game do
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