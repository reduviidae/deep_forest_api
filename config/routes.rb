Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      resources :games
      resources :conversations
      resources :messages
      resources :user_games
      mount ActionCable.server => '/cable'
    end
  end
end
