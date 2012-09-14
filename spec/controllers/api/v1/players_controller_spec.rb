require_relative '../../../spec_helper'

describe Api::V1::PlayersController do
  render_views

  describe "#index" do
    it "should retrieve status code of 200" do
      get :index
      response.status.should eq(200)
    end

    it "should retrieve status code of 200" do
      get :index
      response.header["X-LS-License"].should eq("All Rights Reserved")
    end 
  end
end