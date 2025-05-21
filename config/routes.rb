Rails.application.routes.draw do
  devise_for :users

  resources :roles
  
  get "up" => "rails/health#show", as: :rails_health_check

  root "dashboards#index"
end
