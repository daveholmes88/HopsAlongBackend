Rails.application.routes.draw do
  resources :descriptions
  resources :tags
  resources :ratings
  resources :users
  resources :breweries
  resources :admin_news
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'users#create'
      get '/current_user', to: 'users#show'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
