Rails.application.routes.draw do
  devise_for :users
  root to: "books#index"

  get "test", to: "pages#test"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "style", to: "pages#style"
  get '/dashboard', to: 'pages#dashboard', as: :dashboard
  get '/users/:id/dashboard', to: 'pages#dashboard', as: :user_dashboard

  resources :books, only: %i[index show create new] do
    resources :bookings, only: %i[create new]
    resources :reviews, only: %i[new create]
  end
end
