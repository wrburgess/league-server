FactoryGirl.define do
  factory :player_conference do
    name Faker::Company.name
    abbreviation Faker::Company.name[0..2].upcase
  end
end