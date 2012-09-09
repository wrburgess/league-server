# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game_stat do
    player_id 1
    opponent_id 1
    game_date "2012-09-09"
    season 1
    pa_att 1
    pa_comp 1
    pa_td 1
    pa_yd 1
    pa_int 1
  end
end
