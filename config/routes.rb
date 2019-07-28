Rails.application.routes.draw do
  resources :replies
  resources :reviews
  resources :userbookings
  resources :messages
  resources :conversations
  resources :lessons
  resources :languageskills
  resources :profiles
  resources :notifications
  devise_for :users
  root to: 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
