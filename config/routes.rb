Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :users

      resources :intakes do
        resources :measurements
      end
    end
  end

  scope '/auth' do
    post '/signin', to: 'user_token#create'
    post '/signup', to: 'api/v1/users#create'
  end
end
