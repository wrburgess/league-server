class BrowserController < ApplicationController
  layout 'browser'

  before_filter :set_constants

  def set_constants
    @group_id = params[:group_id]
  end

end