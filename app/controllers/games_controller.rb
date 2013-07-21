class GamesController < ApplicationController
  protect_from_forgery

  def scoreboard
    @page_title = "Scoreboard"
    @body_id = "scoreboard"
    @body_class = "page"
  end

  def schedule
    @page_title = "Schedule"
    @body_id = "schedule"
    @body_class = "page"
  end

end