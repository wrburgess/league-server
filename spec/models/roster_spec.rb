# == Schema Information
#
# Table name: rosters
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  abbreviation :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Roster  do

  it 'has a valid factory' do
    FactoryGirl.create(:roster).should be_valid
  end

  it 'is invalid without a roster name' do
    FactoryGirl.build(:roster, name: nil).should_not be_valid
  end

  it { should have_many(:roster_users) }
  it { should have_many(:users) }

end
