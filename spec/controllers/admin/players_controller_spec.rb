require 'spec_helper'

describe Admin::PlayersController do

  describe "#index" do
    before do
      @player1 = FactoryGirl.create(:player)
      @player2 = FactoryGirl.create(:player)
      @player3 = FactoryGirl.create(:player)
      @players = Player.all
    end

    it "renders the Admin Player index view" do
      get :index
      response.should render_template :index
      response.should render_template layout: "layouts/admin"
    end

    it "assigns the requested players to @players" do
      get :index
      expect(assigns(:players)).to eq @players
    end
  end

  describe "#show" do
    before do
      @player1 = FactoryGirl.create(:player)
      @player2 = FactoryGirl.create(:player)
      @player3 = FactoryGirl.create(:player)
    end

    it "renders the Admin Player show view" do
      get :show, id: @player2
      response.should render_template :show
      response.should render_template layout: "layouts/admin"
    end

    it "assigns the requested player to @player" do
      get :show, id: @player2
      expect(assigns(:player)).to eq @player2
    end
  end
  
  describe "#create" do
    it "adds a new player to the database" do
      post :create, :player => { first_name: "Joe", last_name: "Smith", player_team_id: "1", player_position_id: "1" }
      expect(Player.count).to eq(1)
    end

    it "redirects to the Admin Player show view" do
      post :create, :player => { first_name: "Joe", last_name: "Smith", player_team_id: "1", player_position_id: "1" }
      player = Player.last
      expect(response).to redirect_to admin_player_path(player)
    end
  end

  describe "#update" do
    it "updates a player record in the database" do
      player = FactoryGirl.create(:player)
      post :update, id: player, :player => { first_name: "Phil" }, method: :patch
      player.reload
      expect(player.first_name).to eq("Phil")
    end

    it "redirects to the Admin Player show view" do
      player = FactoryGirl.create(:player)
      post :update, id: player, :player => { first_name: "Bill" }, method: :patch
      expect(response).to redirect_to admin_player_path(player)
    end
  end

  describe "#destroy" do
    it "deletes a player record from the database" do
      player = FactoryGirl.create(:player)
      post :destroy, id: player, method: :delete
      expect { player.reload }.to raise_error(ActiveRecord::RecordNotFound) 
    end

    it "redirects to the Admin Player show view" do
      player = FactoryGirl.create(:player)
      post :destroy, id: player, method: :delete
      expect(response).to redirect_to admin_players_path
    end
  end

end