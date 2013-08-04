FactoryGirl.define do
  factory :player do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    player_team
    player_position
  end
end