require 'spec_helper'

describe Player do
  let(:player) { FactoryGirl.create(:player) }

  it 'has a valid factory' do
    expect(player).to be_valid
  end

  it 'is invalid without a first_name' do
    expect(FactoryGirl.build :player, first_name: nil).to_not be_valid
  end

  it 'is invalid without a last_name' do
    expect(FactoryGirl.build :player, last_name: nil).to_not be_valid
  end

  it 'is invalid without a player_team' do
    expect(FactoryGirl.build :player, player_team_id: nil).to_not be_valid
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
      expect(player.full_name).to eq "Hines Ward"
    end

  end

end
