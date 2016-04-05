class ShortUrlsController < ApplicationController

  def new
    @short_url=ShortUrl.new
  end

  def create
    @short_url = ShortUrl.new(user_params)
    if @short_url.save
      redirect_to short_urls_path
    else
      render :new
    end
  end

  def index
    @short_urls=ShortUrl.all
  end

  def original_url
    url = ShortUrl.find_by_shorty(shorty_params[:id])
    if url.present?
      url.visits_count+=1
      url.save
      redirect_to url.original_url
    end
  end

  private

  def user_params
    params.require(:short_url).permit(:original_url, :user_id,:id)
  end

  def shorty_params
    params.permit(:id)
  end

end