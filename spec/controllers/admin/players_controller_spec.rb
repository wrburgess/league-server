require 'spec_helper'

describe Admin::PlayersController do
  let(:player1) { FactoryGirl.create(:player) }
  let(:player2) { FactoryGirl.create(:player) }
  let(:player3) { FactoryGirl.create(:player) }
  let(:players) { Player.all }

  describe "#index" do
    it "renders the Admin Player index view" do
      get :index
      response.should render_template :index
      response.should render_template layout: "layouts/admin"
    end

    it "assigns the requested players to @players" do
      get :index
      expect(assigns(players)).to eq @players
    end
  end

  describe "#show" do
    it "renders the Admin Player show view" do
      get :show, id: player2
      response.should render_template :show
      response.should render_template layout: "layouts/admin"
    end

    it "assigns the requested player to @player" do
      get :show, id: player2
      expect(assigns(player2)).to eq @player2
    end
  end
  
  describe "#create" do
    it "adds a new player to the database" do
      post :create, :player => { first_name: "Joe", last_name: "Smith", player_team_id: "1", player_position_id: "1" }
      expect(Player.count).to eq 1
    end

    it "redirects to the Admin Player show view" do
      post :create, :player => { first_name: "Joe", last_name: "Smith", player_team_id: "1", player_position_id: "1" }
      player = Player.last
      expect(response).to redirect_to admin_player_path player
    end
  end

  describe "#update" do
    it "updates a player record in the database" do
      post :update, id: player1, :player => { first_name: "Phil" }, method: :patch
      player1.reload
      expect(player1.first_name).to eq "Phil"
    end

    it "redirects to the Admin Player show view" do
      post :update, id: player2, :player => { first_name: "Bill" }, method: :patch
      expect(response).to redirect_to admin_player_path player2
    end
  end

  describe "#destroy" do
    it "deletes a player record from the database" do
      post :destroy, id: player3, method: :delete
      expect { player3.reload }.to raise_error ActiveRecord::RecordNotFound 
    end

    it "redirects to the Admin Player show view" do
      post :destroy, id: player1, method: :delete
      expect(response).to redirect_to admin_players_path
    end
  end

end