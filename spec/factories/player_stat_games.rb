FactoryGirl.define do
  factory :player_stat_game do
    player
    opponent_id 1
    game_date "2012-09-09"
    period 1
    season 1
    pa_att 2
    pa_comp 1
    pa_yd 3
    pa_td 4
    pa_int 5
  end
end
