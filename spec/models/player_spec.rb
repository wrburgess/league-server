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

  it 'is invalid without a team' do
    FactoryGirl.build(:player, team_id: nil).should_not be_valid
  end

  it { should belong_to(:team)}

  describe '#full_name' do

    it 'sets full_name from first_name and last_name' do
      FactoryGirl.create(:player).full_name.should == 'Hines Ward'
    end

  end

end
