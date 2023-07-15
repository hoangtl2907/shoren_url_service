class ShortUrlController < ApplicationController
  def show
    short_url = ShortUrl.find(params[:code])

    redirect_to short_url.url, allow_other_host: true
  end
end
