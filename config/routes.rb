Rails.application.routes.draw do
  resources :todos
  devise_for :users

  # root to: "home#index"
  # get 'home/index'

  root to: "todos#index"
end
