Rails.application.routes.draw do
  # Root route
  root "dashboard#index"

  # Devise routes for admin users (ActiveAdmin integration)
  devise_for :users, ActiveAdmin::Devise.config

  # ActiveAdmin routes
  ActiveAdmin.routes(self)

  # Devise routes for user authentication (users only)
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  # OmniAuth callback routes
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#failure'

  # Profile route for logged-in users
  get 'profile', to: 'users#profile', as: 'profile'

  # Resources for job listings (for searching and viewing jobs)
  resources :jobs, constraints: { id: /\d+/ } do
    # Resources for applications
    resources :applications, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end

  # Resources for user profile pages
  resources :users, only: [:index, :show, :edit, :update]

  # Notification route
  resources :notifications, only: [:index] do
    member do
      patch :mark_as_read
    end
  end

  # Admin routes (only accessible to admin users)
  namespace :admin do
    resources :jobs, except: [:new, :create], constraints: { id: /\d+/ }
    resources :job_applications, only: [:index, :show, :update]
  end
end
