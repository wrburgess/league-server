require 'spec_helper'

describe "Group Standings Page" do
  let!(:group) { FactoryGirl.create(:group) }
  let!(:roster1) { FactoryGirl.create(:roster) }
  let!(:roster2) { FactoryGirl.create(:roster) }
  let!(:roster3) { FactoryGirl.create(:roster) }
  let!(:roster4) { FactoryGirl.create(:roster) }

  it "has the correct default elements" do
    group.rosters << roster1
    group.rosters << roster2
    group.rosters << roster3
    group.rosters << roster4
    visit group_standings_url(group)
    page.should have_css("body.standings")
    page.should have_css("h1", :text => "Standings")
  end
end