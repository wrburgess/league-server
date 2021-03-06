require 'spec_helper'

describe "Group Games Page" do
  let!(:group) { FactoryGirl.create :group }
  let!(:group_division1) { FactoryGirl.create :group_division, group: group, name: "Northern", abbreviation: "NORTH", default: true }
  let!(:group_division2) { FactoryGirl.create :group_division, group: group, name: "Southern", abbreviation: "South" }

  let!(:roster1) { FactoryGirl.create :roster, name: "Illinois Towers" }
  let!(:roster2) { FactoryGirl.create :roster, name: "St. Simons Avians" }
  let!(:roster3) { FactoryGirl.create :roster, name: "Orlando Thunder" }
  let!(:roster4) { FactoryGirl.create :roster, name: "Fairfax Pitbulls" }
  let!(:roster5) { FactoryGirl.create :roster, name: "Des Moines Panthers" }
  let!(:roster6) { FactoryGirl.create :roster, name: "Golden Isles PhishHeads" }
  let!(:roster7) { FactoryGirl.create :roster, name: "Norfolk Dogs" }
  let!(:roster8) { FactoryGirl.create :roster, name: "Northern Virginia River Rats" }

  let!(:group_game1) { FactoryGirl.create :group_game, group: group, season: AppSettings.app_season, period: 1, game_type: "regular" }
  let!(:group_game2) { FactoryGirl.create :group_game, group: group, season: AppSettings.app_season, period: 1, game_type: "regular" }
  let!(:group_game3) { FactoryGirl.create :group_game, group: group, season: AppSettings.app_season, period: 2, game_type: "regular" }
  let!(:group_game4) { FactoryGirl.create :group_game, group: group, season: AppSettings.app_season, period: 2, game_type: "regular" }
  let!(:group_game5) { FactoryGirl.create :group_game, group: group, season: AppSettings.app_season, period: 3, game_type: "regular" }
  let!(:group_game6) { FactoryGirl.create :group_game, group: group, season: AppSettings.app_season, period: 3, game_type: "playoff" }
  let!(:group_game7) { FactoryGirl.create :group_game, group: group, season: AppSettings.app_season, period: 4, game_type: "playoff" }
  let!(:group_game8) { FactoryGirl.create :group_game, group: group, season: AppSettings.app_season, period: 4, game_type: "final" }

  let!(:group_game_opponent1) { FactoryGirl.create :group_game_opponent, group_game: group_game1, roster: roster1, home_roster: true }
  let!(:group_game_opponent2) { FactoryGirl.create :group_game_opponent, group_game: group_game1, roster: roster2, home_roster: false }
  let!(:group_game_opponent3) { FactoryGirl.create :group_game_opponent, group_game: group_game2, roster: roster3, home_roster: true }
  let!(:group_game_opponent4) { FactoryGirl.create :group_game_opponent, group_game: group_game2, roster: roster4, home_roster: false }
  let!(:group_game_opponent5) { FactoryGirl.create :group_game_opponent, group_game: group_game3, roster: roster1, home_roster: true }
  let!(:group_game_opponent6) { FactoryGirl.create :group_game_opponent, group_game: group_game3, roster: roster4, home_roster: false }
  let!(:group_game_opponent7) { FactoryGirl.create :group_game_opponent, group_game: group_game4, roster: roster2, home_roster: true }
  let!(:group_game_opponent8) { FactoryGirl.create :group_game_opponent, group_game: group_game4, roster: roster3, home_roster: false }
  let!(:group_game_opponent9) { FactoryGirl.create :group_game_opponent, group_game: group_game5, roster: roster1, home_roster: true }
  let!(:group_game_opponent10) { FactoryGirl.create :group_game_opponent, group_game: group_game5, roster: roster3, home_roster: false }
  let!(:group_game_opponent11) { FactoryGirl.create :group_game_opponent, group_game: group_game6, roster: roster2, home_roster: true }
  let!(:group_game_opponent12) { FactoryGirl.create :group_game_opponent, group_game: group_game6, roster: roster4, home_roster: false }
  let!(:group_game_opponent13) { FactoryGirl.create :group_game_opponent, group_game: group_game7, roster: roster1, home_roster: false }
  let!(:group_game_opponent14) { FactoryGirl.create :group_game_opponent, group_game: group_game7, roster: roster2, home_roster: true }
  let!(:group_game_opponent15) { FactoryGirl.create :group_game_opponent, group_game: group_game8, roster: roster3, home_roster: false }
  let!(:group_game_opponent16) { FactoryGirl.create :group_game_opponent, group_game: group_game8, roster: roster4, home_roster: true }

  describe "#index" do
    before do
      group.add_rosters [roster1, roster2, roster3, roster4]
      group.add_rosters [roster5, roster6, roster7, roster8], group_division2
    end

    it "has the correct default elements", :slow do
      visit group_games_path group
      page.should have_css "body.games.index"
      page.should have_css "h1", :text => AppSettings.app_alias_game.capitalize.pluralize
    end

    it "redirects to group_game show view", :slow do
      visit group_games_path group
      find("tr.row-#{group_game2.id} td.view a").click
      expect(current_path).to eq group_game_path group, group_game2
    end

    it "redirects to first game > away team group_roster show view", :slow do
      visit group_games_path group
      all("tr.row-#{group_game1.id} td.team-name a")[1].click
      expect(current_path).to eq group_roster_path group, group_game1.group_game_opponents.first.roster_id
    end

    it "renders regular games, playoff games, and final game", :slow do
      visit group_games_path group
      expect(all("table.period").count).to eq 4
      expect(all("tr.regular").count).to eq 5
      expect(all("tr.playoff").count).to eq 2
      expect(all("tr.final").count).to eq 1
    end
  end

  describe "#show" do
    before do
      group.add_rosters [roster1, roster2, roster3, roster4]
      group.add_rosters [roster5, roster6, roster7, roster8], group_division2
    end

    it "has the correct default elements", :slow do
      visit group_game_path group, group_game1
      page.should have_css "body.games.show"
      page.should have_css "h1", :text => AppSettings.app_alias_game.capitalize
    end

    it "redirects to group_game show view", :slow do
      visit group_game_path group, group_game2
      all("tr.row-#{group_game2.id} td.team-name a")[0].click
      expect(current_path).to eq group_roster_path group, group_game2.group_game_opponents.away_first.first.roster
    end

    it "renders a game with a game_type class", :slow do
      visit group_game_path group, group_game7
      expect(all("table.game").count).to eq 1
      expect(all("tr.#{group_game7.game_type}").count).to eq 1
    end
  end
end