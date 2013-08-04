FactoryGirl.define do
  factory :group_log do
    group
    roster
    player
    action "add"
    group_owner false
    note Faker::Company.bs
  end
end