FactoryGirl.define do
  factory :group_game_opponent do
    group_game
    roster
    home_roster false
    calculated_score 0
    adjusted_score 0
  end
end