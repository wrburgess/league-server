require 'spec_helper'

describe GroupUser do

  it 'has a valid factory' do
    FactoryGirl.create(:group_user).should be_valid
  end

  it 'is invalid without a user_id' do
    FactoryGirl.build(:group_user, user_id: nil).should_not be_valid
  end

  it 'is invalid without a group_id' do
    FactoryGirl.build(:group_user, group_id: nil).should_not be_valid
  end

  it 'is invalid without an owner designation' do
    FactoryGirl.build(:group_user, owner: nil).should_not be_valid
  end

  it 'is invalid without a viewer designation' do
    FactoryGirl.build(:group_user, viewer: nil).should_not be_valid
  end

  it { should belong_to(:user) }
  it { should belong_to(:group) }

end
