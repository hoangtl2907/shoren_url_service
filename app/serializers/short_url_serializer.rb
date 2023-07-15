# == Schema Information
#
# Table name: short_urls
#
#  code       :string           not null, primary key
#  url        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortUrlSerializer
  include JSONAPI::Serializer

  attributes :code, :url
end
