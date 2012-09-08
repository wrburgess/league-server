require 'spec_helper'

describe Team do
  
  describe 'validations' do
    it 'has a valid factory' do
      FactoryGirl.create(:team).should be_valid
    end

    it 'is invalid without a location_name' do
      FactoryGirl.build(:team, location_name: nil).should_not be_valid
    end

    it 'is invalid without a nickname' do
      FactoryGirl.build(:team, nickname: nil).should_not be_valid
    end

    it 'is invalid without an abbreviation' do
      FactoryGirl.build(:team, abbreviation: nil).should_not be_valid
    end
  end

  describe 'associations' do
    it { should have_many(:players) }
  end

  describe "#full_name" do
    it 'sets full_name from location_name and nickname' do
      FactoryGirl.create(:team).full_name.should == 'Georgia Bulldogs'
    end
  end

end
