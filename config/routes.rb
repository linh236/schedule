Rails.application.routes.draw do
  resources :events
  devise_for :users
  get "dashboard", to: "dashboard#index"
  
  post "check_in", to: "attendance_logs#check_in"
  put "check_out", to: "attendance_logs#check_out"

  root to: "dashboard#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
