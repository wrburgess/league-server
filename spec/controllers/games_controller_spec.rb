require 'spec_helper'

describe GamesController do

  describe "#index" do
    before do
      @group = FactoryGirl.create :group 
      @roster1 = FactoryGirl.create :roster, name: "Chicago Bulls", abbreviation: "CHI"
      @roster2 = FactoryGirl.create :roster, name: "Miami Marlins", abbreviation: "MIA"
      @roster3 = FactoryGirl.create :roster, name: "Atlanta Falcons", abbreviation: "ATL"
      @roster4 = FactoryGirl.create :roster, name: "Detroit Red Wings", abbreviation: "DET"
      @group.add_rosters [@roster1, @roster2, @roster3, @roster4]

      @group_game1 = FactoryGirl.create :group_game, group: @group, season: AppSettings.app_season, period: 1, game_type: "regular"
      @group_game2 = FactoryGirl.create :group_game, group: @group, season: AppSettings.app_season, period: 1, game_type: "regular"
      @group_game3 = FactoryGirl.create :group_game, group: @group, season: AppSettings.app_season, period: 2, game_type: "regular"
      @group_game4 = FactoryGirl.create :group_game, group: @group, season: AppSettings.app_season, period: 2, game_type: "regular"
      @group_game5 = FactoryGirl.create :group_game, group: @group, season: AppSettings.app_season, period: 3, game_type: "regular"
      @group_game6 = FactoryGirl.create :group_game, group: @group, season: AppSettings.app_season, period: 3, game_type: "regular"
      @group_game7 = FactoryGirl.create :group_game, group: @group, season: AppSettings.app_season, period: 4, game_type: "playoff"
      @group_game8 = FactoryGirl.create :group_game, group: @group, season: AppSettings.app_season, period: 4, game_type: "final"
      @group_game_opponent1 = FactoryGirl.create :group_game_opponent, group_game: @group_game1, roster: @roster1, home_roster: true
      @group_game_opponent2 = FactoryGirl.create :group_game_opponent, group_game: @group_game1, roster: @roster2, home_roster: false
      @group_game_opponent3 = FactoryGirl.create :group_game_opponent, group_game: @group_game2, roster: @roster3, home_roster: true
      @group_game_opponent4 = FactoryGirl.create :group_game_opponent, group_game: @group_game2, roster: @roster4, home_roster: false
      @group_game_opponent5 = FactoryGirl.create :group_game_opponent, group_game: @group_game3, roster: @roster1, home_roster: true
      @group_game_opponent6 = FactoryGirl.create :group_game_opponent, group_game: @group_game3, roster: @roster4, home_roster: false
      @group_game_opponent7 = FactoryGirl.create :group_game_opponent, group_game: @group_game4, roster: @roster2, home_roster: true
      @group_game_opponent8 = FactoryGirl.create :group_game_opponent, group_game: @group_game4, roster: @roster3, home_roster: false
      @group_game_opponent9 = FactoryGirl.create :group_game_opponent, group_game: @group_game5, roster: @roster1, home_roster: true
      @group_game_opponent10 = FactoryGirl.create :group_game_opponent, group_game: @group_game5, roster: @roster3, home_roster: false
      @group_game_opponent11 = FactoryGirl.create :group_game_opponent, group_game: @group_game6, roster: @roster2, home_roster: true
      @group_game_opponent12 = FactoryGirl.create :group_game_opponent, group_game: @group_game6, roster: @roster4, home_roster: false
      @group_game_opponent13 = FactoryGirl.create :group_game_opponent, group_game: @group_game7, roster: @roster1, home_roster: false
      @group_game_opponent14 = FactoryGirl.create :group_game_opponent, group_game: @group_game7, roster: @roster2, home_roster: true
      @group_game_opponent15 = FactoryGirl.create :group_game_opponent, group_game: @group_game8, roster: @roster3, home_roster: false
      @group_game_opponent16 = FactoryGirl.create :group_game_opponent, group_game: @group_game8, roster: @roster4, home_roster: true
      @group_games = @group.group_games.where(season: AppSettings.app_season)
    end

    it "renders the 'games' template under the 'browser' layout" do
      get :index, group_id: @group
      response.should render_template :index
      response.should render_template layout: "layouts/browser"
    end

    it "assigns the requested period groups to @periods" do
      get :index, group_id: @group
      group_games = GroupGame.where(group: @group, season: AppSettings.app_season)
      @periods = group_games.group_by { |group_game| group_game.period }
      expect(assigns(:periods)).to eq @periods
    end
  end

end