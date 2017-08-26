Rails.application.routes.draw do
  # TODO機能作成してないのでとりあえずユーザーリストに
  root 'users#index'
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy ]
  resources :login, only: [:index, :create] do
    collection do
      delete  '/', to: "login#delete"
    end
  end
end
