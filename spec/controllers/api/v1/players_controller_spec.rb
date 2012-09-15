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

    xit "should retrieve records-returned header" do
      get :index
      response.header["X-LS-Records-Returned"].should == "200"
    end

    xit "should retrieve at least one record" do
      get :index
      response.body.should eq("All Rights Reserved")
    end
  end
end