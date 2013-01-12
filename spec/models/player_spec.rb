require 'spec_helper'

describe Player do

  it 'has a valid factory' do
    FactoryGirl.create(:player).should be_valid
  end

  it 'is invalid without a first_name' do
    FactoryGirl.build(:player, first_name: nil).should_not be_valid
  end

  it 'is invalid without a last_name' do
    FactoryGirl.build(:player, last_name: nil).should_not be_valid
  end

  it 'is invalid without a player_team' do
    FactoryGirl.build(:player, player_team_id: nil).should_not be_valid
  end

  it { should belong_to(:player_team) }
  it { should belong_to(:player_position) }
  it { should have_many(:group_player_teams) }
  it { should have_many(:groups) }
  it { should have_many(:player_stat_games) }
  it { should have_many(:player_stat_seasons) }
  it { should have_one(:player_stat_career) }
  it { should have_many(:roster_slots) }
  it { should have_many(:rosters) }

  describe '#full_name' do

    it 'sets full_name from first_name and last_name' do
      FactoryGirl.create(:player).full_name.should == 'Hines Ward'
    end

  end

end
