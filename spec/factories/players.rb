FactoryGirl.define do

  factory :player do
    first_name "Hines"
    last_name "Ward"
    team_id { rand(1000) }
  end

end