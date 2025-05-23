Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]

  resources :roles

  resources :admin_screens, only: [:index]
  
  get "up" => "rails/health#show", as: :rails_health_check

  root "dashboards#index"
end
