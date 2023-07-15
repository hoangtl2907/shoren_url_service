require 'rails_helper'

RSpec.describe ShortUrlController, type: :request do
  describe 'GET #show' do
    context 'when code is exist' do
      before do
        create(:short_url, code: code, url: url)
      end

      let(:code) { 'abcdef' }
      let(:url) { 'localhost:3000' }

      it 'redirects to original url' do
        get "/#{code}"
        expect(response).to redirect_to url
      end
    end

    context 'when code is not exist' do
      before do
        create(:short_url, url: url)
      end

      let(:code) { 'abcdef' }
      let(:url) { 'localhost:3000' }

      it 'redirects to original url' do
        get "/#{code}"
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
