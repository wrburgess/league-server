require 'spec_helper'

describe GroupPlayerTeam do

  it 'has a valid factory' do
    FactoryGirl.create(:group_player_team).should be_valid
  end

  it 'is invalid without a group' do
    FactoryGirl.build(:group_player_team, group_id: nil).should_not be_valid
  end

  it 'is invalid without a player_team' do
    FactoryGirl.build(:group_player_team, player_team_id: nil).should_not be_valid
  end

  it { should belong_to(:group) }
  it { should belong_to(:player_team) }

end