Rails.application.routes.draw do
  resources :kpi_data
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      get '/login', to: 'users#token_authenticate'
      post '/login', to: 'auth#create'
      post '/signup', to: 'users#create'
      get '/profile', to: 'users#profile'
    end
  end
end
