require 'spec_helper'

describe GamesController do
  let!(:group) { FactoryGirl.create :group }
  let!(:roster1) { FactoryGirl.create :roster, name: "Chicago Bulls", abbreviation: "CHI" }
  let!(:roster2) { FactoryGirl.create :roster, name: "Miami Marlins", abbreviation: "MIA" }
  let!(:roster3) { FactoryGirl.create :roster, name: "Atlanta Falcons", abbreviation: "ATL" }
  let!(:roster4) { FactoryGirl.create :roster, name: "Detroit Red Wings", abbreviation: "DET" }

  let(:group_game1) { FactoryGirl.create :group_game, group: group, season: AppSettings.app_season, period: 1, game_type: "regular" }
  let(:group_game2) { FactoryGirl.create :group_game, group: group, season: AppSettings.app_season, period: 1, game_type: "regular" }
  let(:group_game3) { FactoryGirl.create :group_game, group: group, season: AppSettings.app_season, period: 2, game_type: "regular" }
  let(:group_game4) { FactoryGirl.create :group_game, group: group, season: AppSettings.app_season, period: 2, game_type: "regular" }
  let(:group_game5) { FactoryGirl.create :group_game, group: group, season: AppSettings.app_season, period: 3, game_type: "regular" }
  let(:group_game6) { FactoryGirl.create :group_game, group: group, season: AppSettings.app_season, period: 3, game_type: "regular" }
  let(:group_game7) { FactoryGirl.create :group_game, group: group, season: AppSettings.app_season, period: 4, game_type: "playoff" }
  let(:group_game8) { FactoryGirl.create :group_game, group: group, season: AppSettings.app_season, period: 4, game_type: "final" }
  let(:group_game_opponent1) { FactoryGirl.create :group_game_opponent, group_game: group_game1, roster: @roster1, home_roster: true }
  let(:group_game_opponent2) { FactoryGirl.create :group_game_opponent, group_game: group_game1, roster: @roster2, home_roster: false }
  let(:group_game_opponent3) { FactoryGirl.create :group_game_opponent, group_game: group_game2, roster: @roster3, home_roster: true }
  let(:group_game_opponent4) { FactoryGirl.create :group_game_opponent, group_game: group_game2, roster: @roster4, home_roster: false }
  let(:group_game_opponent5) { FactoryGirl.create :group_game_opponent, group_game: group_game3, roster: @roster1, home_roster: true }
  let(:group_game_opponent6) { FactoryGirl.create :group_game_opponent, group_game: group_game3, roster: @roster4, home_roster: false }
  let(:group_game_opponent7) { FactoryGirl.create :group_game_opponent, group_game: group_game4, roster: @roster2, home_roster: true }
  let(:group_game_opponent8) { FactoryGirl.create :group_game_opponent, group_game: group_game4, roster: @roster3, home_roster: false }
  let(:group_game_opponent9) { FactoryGirl.create :group_game_opponent, group_game: group_game5, roster: @roster1, home_roster: true }
  let(:group_game_opponent10) { FactoryGirl.create :group_game_opponent, group_game: group_game5, roster: @roster3, home_roster: false }
  let(:group_game_opponent11) { FactoryGirl.create :group_game_opponent, group_game: group_game6, roster: @roster2, home_roster: true }
  let(:group_game_opponent12) { FactoryGirl.create :group_game_opponent, group_game: group_game6, roster: @roster4, home_roster: false }
  let(:group_game_opponent13) { FactoryGirl.create :group_game_opponent, group_game: group_game7, roster: @roster1, home_roster: false }
  let(:group_game_opponent14) { FactoryGirl.create :group_game_opponent, group_game: group_game7, roster: @roster2, home_roster: true }
  let(:group_game_opponent15) { FactoryGirl.create :group_game_opponent, group_game: group_game8, roster: @roster3, home_roster: false }
  let(:group_game_opponent16) { FactoryGirl.create :group_game_opponent, group_game: group_game8, roster: @roster4, home_roster: true }
  let(:group_games) { group.group_games.where(season: AppSettings.app_season) }
  let(:periods) { group_games.group_by { |group_game| group_game.period } }

  before do
    group.add_rosters [@roster1, @roster2, @roster3, @roster4]
  end

  describe "#index" do
    it "renders the 'games' template under the 'browser' layout" do
      get :index, group_id: group
      response.should render_template :index
      response.should render_template layout: "layouts/browser"
    end

    it "assigns the requested period groups to periods" do
      get :index, group_id: group
      expect(assigns(:periods)).to eq periods
    end
  end

  describe "#show" do
    it "renders the 'game' template under the 'browser' layout" do
      get :show, group_id: group, id: group_game2
      response.should render_template :show
      response.should render_template layout: "layouts/browser"
    end

    it "assigns the requested period groups to @periods" do
      get :show, group_id: group, id: group_game3
      expect(assigns(:group_game)).to eq group_game3
    end
  end

end