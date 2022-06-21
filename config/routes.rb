Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#pres'

  resources :spots, only: [:show]

  resources :activities do
    resources :participations, except: [:index]
  end

  get '/dashboard', to: 'pages#dashboard'

  get '/profile', to: 'pages#profile'

  resources :contacts, only: [:new, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
