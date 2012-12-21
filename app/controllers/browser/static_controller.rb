class Browser::StaticController < ApplicationController
  protect_from_forgery

  def index
    @page_title = "Home"
    @body_id = "home"
    @body_class = "page"
  end

end