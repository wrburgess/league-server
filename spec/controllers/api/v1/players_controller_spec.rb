require_relative '../../../spec_helper'

describe Api::V1::PlayersController do
  render_views

  before do
    @player1 = FactoryGirl.create(:player, first_name: "Joe", last_name: "Smith", team_id: 1)
    @player2 = FactoryGirl.create(:player, first_name: "Bob", last_name: "Jones", team_id: 2)
    @player3 = FactoryGirl.create(:player, first_name: "Peter", last_name: "Wilson", team_id: 3)
  end

  describe "#index" do

    before do
      get :index, :format => :json
    end

    it "should retrieve status code of 200" do
      response.response_code.should == 200
    end

    it "should retrieve license header" do
      response.header["X-LS-License"].should == "All Rights Reserved"
    end

    it "should retrieve application name header" do
      response.header["X-LS-Application"].should == "league-server"
    end

    it "should retrieve records-returned header" do
      response.header["X-LS-Records-Returned"].should be_present
    end

    it "should retrieve a content-type of json" do
      response.header['Content-Type'].should include 'application/json'
    end

    it "should retrieve list of players" do
      players = Player.all
      players.count.should == 3

      response.body.should include(@player1.id.to_s)
      response.body.should include(@player2.id.to_s)
      response.body.should include(@player3.id.to_s)
      response.body.should include('Joe Smith')
      response.body.should include('Bob Jones')
      response.body.should include('Peter Wilson')
    end
  end

  describe "#show" do

    before do
      get :show, id: @player1.id, :format => :json
    end

    it "should retrieve status code of 200" do
      response.response_code.should == 200
    end

    it "should retrieve application name header" do
      response.header["X-LS-Application"].should == "league-server"
    end

    it "should retrieve license header" do
      response.header["X-LS-License"].should == "All Rights Reserved"
    end

    it "should retrieve records-returned header" do
      response.header["X-LS-Records-Returned"].should == "1"
    end

    it "should retrieve a content-type of json" do
      response.header['Content-Type'].should include 'application/json'
    end

    it "should retrieve a single player" do
      player = Player.where id: @player1.id
      player.count.should == 1

      response.body.should include(@player1.id.to_s)
      response.body.should include('Joe Smith')
    end
  end
end