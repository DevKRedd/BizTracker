Rails.application.routes.draw do
  resources :user_dashboards
  resources :kpi_data
  post '/addData', to: 'user_dashboards#create' 
  post '/addKpiData', to: 'kpi_data#create'
  post '/getKpiData', to: 'kpi_data#get_kpi'
  get 'users/:id/user_dashboard', to: 'user_dashboards#my_dashboard'
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
