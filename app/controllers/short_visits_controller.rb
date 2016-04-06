class ShortVisitsController < ApplicationController

  before_filter :authorize

  def show
    @short_visit=ShortVisit.where(short_url_id:params[:short_url_id]).last(10)
  end
end