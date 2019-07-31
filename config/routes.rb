Rails.application.routes.draw do
  resources :replies
  resources :reviews
  resources :userbookings
  resources :conversations
  resources :messages
  resources :lessons
  resources :languageskills
  resources :profiles
  resources :notifications
  devise_for :users
  put '/userbookings/completelesson/:id', to: 'userbookings#completelesson'
  root to: 'pages#landing'
  get '/browse', to: 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
