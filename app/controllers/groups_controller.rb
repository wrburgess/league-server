class GroupsController < ApplicationController
  protect_from_forgery

  def draft
    @group = Group.find(params[:group_id])

    @page_title = "Draft Room"
    @body_id = "group_draft"
    @body_class = "page"
  end

  def show
    @group = Group.find(params[:group_id])

    @page_title = "League Home"
    @body_id = "group_show"
    @body_class = "page"
  end

  def standings
    @group = Group.find(params[:group_id])

    @page_title = "Standings"
    @body_id = "group_standings"
    @body_class = "page"
  end

  def transactions
    @group = Group.find(params[:group_id])

    @page_title = "Transactions"
    @body_id = "group_transactions"
    @body_class = "page"
  end

end