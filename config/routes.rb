Rails.application.routes.draw do
  devise_for :users
  resources :judges, only: [:new, :create]
  root to: 'tree#index'
end
