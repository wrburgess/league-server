require 'spec_helper'

describe PlayerConference do

  describe 'validations' do
    it 'has a valid factory' do
      FactoryGirl.create(:player_conference).should be_valid
    end

    it 'is invalid without a name' do
      FactoryGirl.build(:player_conference, name: nil).should_not be_valid
    end

    it 'is invalid without an abbreviation' do
      FactoryGirl.build(:player_conference, abbreviation: nil).should_not be_valid
    end
  end

  describe 'associations' do
    it { should have_many(:player_teams) }
    it { should have_many(:players) }
  end

  describe "#full_name" do
    it 'sets full_name from name and abbreviation' do
      FactoryGirl.create(:player_conference, name: "Southeastern", abbreviation: "SEC").full_name.should == "Southeastern Conference (SEC)"
    end
  end

end
