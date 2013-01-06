require 'spec_helper'

describe RosterUser do

  it 'has a valid factory' do
    FactoryGirl.create(:roster_user).should be_valid
  end

  it 'is invalid without a user_id' do
    FactoryGirl.build(:roster_user, user_id: nil).should_not be_valid
  end

  it 'is invalid without a roster_id' do
    FactoryGirl.build(:roster_user, roster_id: nil).should_not be_valid
  end

  it 'is invalid without an owner designation' do
    FactoryGirl.build(:roster_user, owner: nil).should_not be_valid
  end

  it 'is invalid without a viewer designation' do
    FactoryGirl.build(:roster_user, viewer: nil).should_not be_valid
  end

  it { should belong_to(:user) }
  it { should belong_to(:roster) }

end
