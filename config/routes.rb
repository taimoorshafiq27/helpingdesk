Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]

  resources :roles, except: [:destroy]

  resources :tickets, except: [:destroy] do
    resources :comments, only: [:create]
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "dashboards#index"
end
