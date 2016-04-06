class ShortVisitsController < ApplicationController

  before_filter :authorize

  def create
    ShortVisit.create(short_urls_id: params[:short_url_id],visitor_ip:params[:ip],visitor_country_iso2:params[:country_name])
    flash[:notice]="location added"
  end

  def show
    @short_visit=ShortVisit.where(short_url_id:params[:short_url_id]).last(10)
  end
end