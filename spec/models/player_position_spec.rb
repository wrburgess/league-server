require 'spec_helper'

describe PlayerPosition do

  it 'has a valid factory' do
    FactoryGirl.create(:player_position).should be_valid
  end

  it 'is invalid without a name' do
    FactoryGirl.build(:player_position, name: nil).should_not be_valid
  end

  it 'is invalid without an abbreviation' do
    FactoryGirl.build(:player_position, abbreviation: nil).should_not be_valid
  end

  it 'is invalid without a weight' do
    FactoryGirl.build(:player_position, weight: nil).should_not be_valid
  end

  it { should have_many(:players) }

end