Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :projects do
    resources :tasks
  end
end
