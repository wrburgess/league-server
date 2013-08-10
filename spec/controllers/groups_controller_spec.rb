require 'spec_helper'

describe GroupsController, :type => :controller do

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

  describe "#draft" do
    it "renders the 'draft' template under the 'browser' layout" do
      get :draft, group_id: @group, id: @roster1
      response.should render_template :draft
      response.should render_template layout: "layouts/browser"
    end

    it "assigns the requested group to @group" do
      get :draft, group_id: @group, id: @roster1
      expect(assigns(:group)).to eq @group
    end
  end

  describe "#show" do
    it "renders the 'show' template under the 'browser' layout" do
      get :show, group_id: @group, id: @roster1
      response.should render_template :show
      response.should render_template layout: "layouts/browser"
    end

    it "assigns the requested group to @group" do
      get :show, group_id: @group, id: @roster1
      expect(assigns(:group)).to eq @group
    end
  end

  describe "#standings" do
    it "renders the 'standings' template under the 'browser' layout" do
      get :standings, group_id: @group
      response.should render_template :standings
      response.should render_template layout: "layouts/browser"
    end

    it "assigns the requested group to @group" do
      get :standings, group_id: @group
      expect(assigns(:group)).to eq @group
    end
  end

  describe "#games" do
    before do
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
      get :games, group_id: @group
      response.should render_template :games
      response.should render_template layout: "layouts/browser"
    end

    it "assigns the requested period groups to @periods" do
      get :games, group_id: @group
      group_games = GroupGame.where(group: @group, season: AppSettings.app_season)
      @periods = group_games.group_by { |group_game| group_game.period }
      expect(assigns(:periods)).to eq @periods
    end
  end

  describe "#transactions" do
    it "renders the 'transactions' template under the 'browser' layout" do
      get :transactions, group_id: @group, id: @roster1
      response.should render_template :transactions
      response.should render_template layout: "layouts/browser"
    end

    it "assigns the requested group to @group" do
      get :transactions, group_id: @group, id: @roster1
      expect(assigns(:group)).to eq @group
    end
  end

end