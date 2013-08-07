require 'spec_helper'

describe "Group Games Page" do
  # let!(:group) { FactoryGirl.create :group }
  # let(:roster1) { FactoryGirl.create :roster, group: group }
  # let(:roster2) { FactoryGirl.create :roster }
  # let(:roster3) { FactoryGirl.create :roster }
  # let(:roster4) { FactoryGirl.create :roster }
  # let(:roster5) { FactoryGirl.create :roster }
  # let(:roster6) { FactoryGirl.create :roster }
  # let(:roster7) { FactoryGirl.create :roster }
  # let(:roster8) { FactoryGirl.create :roster }

  # describe "#games" do
  #   before do
  #     group.rosters << roster1
  #     group.rosters << roster2
  #     group.rosters << roster3
  #     group.rosters << roster4
  #     group.rosters << roster5
  #     group.rosters << roster6
  #     group.rosters << roster7
  #     group.rosters << roster8
  #   end

  #   it "has the correct default elements", :slow do
  #     visit group_games_path(group)
  #     page.should have_css("body.games")
  #     page.should have_css("h1", :text => "Games")
  #   end

  #   it "redirects to first team group_game show view", :slow do
  #     visit group_games_path(group, game1)
  #     find("tr.row-#{game1.id} td.name a").click
  #     expect(current_path).to eq group_game_path group, game1
  #   end

  #   it "redirects to last team group_roster show view", :slow do
  #     visit group_standings_path(group, roster6)
  #     find("tr.row-#{game2.id} td.away-roster-name a").click
  #     expect(current_path).to eq group_roster_path group, game2
  #   end
  # end
end