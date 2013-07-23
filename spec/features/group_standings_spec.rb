require 'spec_helper'

describe "Group Standings Page" do

  before do
    @group = FactoryGirl.create(:group)
    @roster1 = FactoryGirl.create(:roster)
    @roster2 = FactoryGirl.create(:roster)
    @roster3 = FactoryGirl.create(:roster)
    @roster4 = FactoryGirl.create(:roster)
    @group.rosters << @roster1
    @group.rosters << @roster2
    @group.rosters << @roster3
    @group.rosters << @roster4
  end

  it "has the correct default elements" do
    visit group_standings_url(@group)
    page.should have_css("body.standings")
    page.should have_css("h1", :text => "Standings")
  end

end