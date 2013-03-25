require_relative '../../spec_helper'

describe AppSettings do
  it "should retrieve app name" do
    AppSettings.app_name.should eq("league-server")
  end

  it "should not retrieve wrong app name" do
    AppSettings.app_name.should_not eq("roto-something")
  end

  it "should retrieve server name" do
    AppSettings.app_server.should eq("Test")
  end
end
