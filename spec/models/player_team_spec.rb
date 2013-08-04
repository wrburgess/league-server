require 'spec_helper'

describe PlayerTeam do

  describe 'validations' do
    it 'has a valid factory' do
      FactoryGirl.create(:player_team).should be_valid
    end

    it 'is invalid without a location_name' do
      FactoryGirl.build(:player_team, location_name: nil).should_not be_valid
    end

    it 'is invalid without a nickname' do
      FactoryGirl.build(:player_team, nickname: nil).should_not be_valid
    end

    it 'is invalid without an abbreviation' do
      FactoryGirl.build(:player_team, abbreviation: nil).should_not be_valid
    end
  end

  describe 'associations' do
    it { should have_many(:players) }
  end

  describe "#full_name" do
    it 'sets full_name from location_name and nickname' do
      FactoryGirl.create(:player_team, location_name: "Georgia", nickname: "Bulldogs").full_name.should == 'Georgia Bulldogs'
    end
  end

end
