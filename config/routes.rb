Rails.application.routes.draw do
  root to: 'pages#pres'

  devise_for :users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  resources :spots, only: [:show]

  resources :activities do
    resources :participations, except: [:index]
  end

  get '/dashboard', to: 'pages#dashboard'

  get '/profile', to: 'pages#profile'

  resources :contacts, only: [:new, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
