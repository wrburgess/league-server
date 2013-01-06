FactoryGirl.define do

  factory :group_log do
    group_id 1
    roster_id 1
    player_id 1
    action "add"
    group_owner false
  end

end