FactoryBot.define do
  factory :short_url, class: ShortUrl do
    url { 'localhost:3000' }
  end
end
