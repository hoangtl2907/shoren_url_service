# == Schema Information
#
# Table name: short_urls
#
#  code       :string           not null, primary key
#  url        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortUrl < ApplicationRecord
  CODE_MAX_LENGTH = 6

  validates :code, length: { maximum: CODE_MAX_LENGTH }
  validates :url, presence: true

  after_initialize :generate_code

  private

  def generate_code
    seq = ActiveRecord::Base.connection.execute("SELECT nextval('short_urls_code_seq')").first['nextval']
    self.code = seq.base62_encode
  end
end
