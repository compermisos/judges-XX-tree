Rails.application.routes.draw do
  devise_for :users
  resources :judges, only: [:new, :create, :index, :update]
  root to: 'tree#index'
end
