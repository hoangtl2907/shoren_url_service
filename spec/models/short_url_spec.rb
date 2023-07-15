# == Schema Information
#
# Table name: short_urls
#
#  code       :string           not null, primary key
#  url        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe ShortUrl, type: :model do
  describe 'validations' do
    it { is_expected.to validate_length_of(:code).is_at_most(6) }
    it { is_expected.to validate_presence_of(:url) }
  end

  describe 'callbacks' do
    it { is_expected.to callback(:generate_code).after(:initialize) }
  end
end
