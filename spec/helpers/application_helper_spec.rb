require 'spec_helper'

describe ApplicationHelper do

  describe "#commish_flag" do
    it 'returns flag to mark group log entry executed by commish' do
      log = FactoryGirl.create :group_log, group_owner: true
      commish_flag(log).should == "commish-action"
    end

    it 'returns no flag to mark group log entry executed by owner' do
      log = FactoryGirl.create :group_log, group_owner: false
      commish_flag(log).should == ""
    end
  end

end