require 'spec_helper'

describe PlayersController do
  let(:group) { FactoryGirl.create(:group) }
  let(:roster) { FactoryGirl.create(:roster) }
  let(:player1) { FactoryGirl.create(:player) }
  let(:player2) { FactoryGirl.create(:player) }
  let(:player3) { FactoryGirl.create(:player) }
  let(:players) { Player.all }

  describe "#show" do
    it "renders the Player show view" do
      roster
      get :show, id: player2, group_id: group
      response.should render_template :show
      response.should render_template layout: "layouts/browser"
    end

    it "assigns the requested player to @player" do
      roster
      get :show, id: player2, group_id: group
      expect(assigns(player2)).to eq @player2
    end
  end

end