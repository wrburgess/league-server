FactoryGirl.define do

  factory :group_log do
    transaction_id 1
    group_id 1
    roster_id 1
    player_id 1
    action "add"
    group_owner false
    note "here's a note"
  end

end