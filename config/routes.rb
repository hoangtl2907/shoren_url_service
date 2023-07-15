Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/'
  mount Rswag::Api::Engine => '/api-docs'

  get '/:code' => 'short_url#show', :as => 'short_url'

  namespace :api do
    resource :shorten, only: %i[create]
  end
end
