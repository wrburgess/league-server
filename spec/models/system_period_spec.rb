require 'spec_helper'

describe SystemPeriod do

  it "has a valid factory" do
    FactoryGirl.create(:system_period).should be_valid
  end

  it "is invalid without a period" do
    FactoryGirl.build(:system_period, period: nil).should_not be_valid
  end

  it "is invalid without a start_date" do
    FactoryGirl.build(:system_period, start_date: nil).should_not be_valid
  end

  it "is invalid without a end_date " do
    FactoryGirl.build(:system_period, end_date: nil).should_not be_valid
  end

end