Rails.application.routes.draw do
  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Define root path route ("/")
  # root "posts#index"

  # Use Doorkeeper if you need OAuth
  use_doorkeeper

  namespace :api do
    namespace :v1 do
      # Authentication routes
      post 'auth/sign_in', to: 'auth#sign_in'
      delete 'auth/sign_out', to: 'auth#sign_out'

      # Resources
      resources :verticals
      resources :categories
      resources :courses

      # Search route
      get 'search', to: 'search#index'
    end
  end
  # Devise routes for user authentication
  devise_for :users
end