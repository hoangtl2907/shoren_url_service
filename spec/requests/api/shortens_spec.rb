require 'swagger_helper'

RSpec.describe 'api/shortens', type: :request do

  path '/api/shorten' do

    post('create shorten url') do
      tags 'Shorten Url'
      produces 'application/json'
      consumes 'application/json'
      parameter name: :params, in: :body, type: :object, schema: {
        type: :object,
        properties: {
          url: { type: :string, nullable: false }
        }
      }

      response(200, 'successful') do
        schema type: :object,
          properties: {
            data: {
              type: :object,
              properties: {
                id: { type: :string, nullable: false },
                type: { type: :string, nullable: false },
                attributes: {
                  type: :object,
                  properties: {
                    code: { type: :string, nullable: false },
                    url: { type: :string, nullable: false }
                  }
                }
              }
            },
            links: {
              type: :object,
              properties: {
                short_url: { type: :string, nullable: false }
              }
            }
          }

        let(:params) { { url: 'http://localhost:3000' } }

        run_test!
      end

      response(422, 'unprocessable entity') do
        schema type: :object,
          properties: {
            errors: {
              type: :array,
              items: { type: :string }
            }
          }

        let(:params) { { url: nil } }

        run_test!
      end
    end
  end
end
