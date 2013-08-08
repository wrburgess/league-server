require 'spec_helper'

describe RosterStatCareer do

  it 'has a valid factory' do
    FactoryGirl.create(:roster_stat_career).should be_valid
  end

  it 'is invalid without a roster' do
    FactoryGirl.build(:roster_stat_career, roster: nil).should_not be_valid
  end

  it { should belong_to(:roster) }

end