require 'spec_helper'

describe "Admin Player CRUD" do

  before do
    @player1 = FactoryGirl.create(:player)
    @player2 = FactoryGirl.create(:player)
    @player3 = FactoryGirl.create(:player)
    @player4 = FactoryGirl.create(:player)
  end

  describe "#index" do
    it "has the correct default elements" do
      visit admin_players_path
      page.should have_css("body.players.index")
    end
  end

  describe "#show" do
    it "has the correct default elements" do
      visit admin_player_path(@player1)
      page.should have_css("body.players.show")
    end
  end

  describe "#new" do
    it "has the correct default elements" do
      visit new_admin_player_path
      page.should have_css("body.players.new")
    end
  end

  describe "#edit" do
    it "has the correct default elements" do
      visit edit_admin_player_path(@player1)
      page.should have_css("body.players.edit")
    end
  end

end