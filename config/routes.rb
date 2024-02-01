Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'contacts/index'
  get 'studentxp/index'
  resources :courses

  get 'checkout', to: 'checkouts#show'
  get 'checkout/success', to: 'checkouts#success'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "home#index"
  get '/about', to: 'about#index'
  
  resources :students, only: [:index, :show]

  get '/teacher', to: 'teacher#index'
  get '/teacher/students', to: 'teacher#students'
  get '/teacher/courses', to: 'teacher#courses'

  resource :cart, only: [:destroy]
end
