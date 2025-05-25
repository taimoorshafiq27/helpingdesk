Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]

  resources :roles

  resources :tickets
  
  get "up" => "rails/health#show", as: :rails_health_check

  root "dashboards#index"
end
