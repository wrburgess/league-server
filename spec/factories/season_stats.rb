# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :season_stat do
    player_id 1
    season 1
    pa_att 2
    pa_comp 1
    pa_td 4
    pa_yd 3
    pa_int 5
  end
end
