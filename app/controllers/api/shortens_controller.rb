module Api
  class ShortensController < ApiController
    def create
      short_url = ShortUrl.new(url: params[:url])

      if short_url.save
        options = { links: { short_url: short_url_url(short_url.code) } }
        render json: ShortUrlSerializer.new(short_url, options).serializable_hash
      else
        render json: { errors: short_url.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
end
