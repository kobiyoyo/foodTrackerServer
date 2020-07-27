Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users

      resources :intakes do
        resources :measurements
      end
    end
  end
 mount Raddocs::App => "/docs"
  scope '/auth' do
    post '/signin', to: 'user_token#create'
    post '/signup', to: 'api/v1/users#create'
  end
end
