class StaticController < ActionController::Base
  protect_from_forgery

  def index
    @test = "instance works"
  end

end