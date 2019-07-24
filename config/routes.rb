Rails.application.routes.draw do
  resources :conversations
  resources :languageskills
  resources :profiles
  resources :notifications
  devise_for :users
  root to: 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
