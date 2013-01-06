require 'spec_helper'

describe GroupPlayerTeam do

  it 'has a valid factory' do
    FactoryGirl.create(:group_player_team).should be_valid
  end

  it 'is invalid without a group division name' do
    FactoryGirl.build(:group_player_team, name: nil).should_not be_valid
  end

  it { should belong_to(:group) }
  it { should belong_to(:player_team) }
  it { should belong_to(:players) }

end