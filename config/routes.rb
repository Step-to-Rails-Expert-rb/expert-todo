Rails.application.routes.draw do
  devise_for :users
  root "welcome#index"
  
  resources :tasks, except: [:show]
end
