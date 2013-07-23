class RostersController < BrowserController

  def show
    @roster = Roster.find(1)
  end

  def index

  end

end