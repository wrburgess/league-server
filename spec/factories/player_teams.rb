FactoryGirl.define do
  factory :player_team do
    location_name Faker::Address.state
    nickname Faker::Loren.word
    abbreviation Faker::Address.state_abbr
    player_conference
  end
end
