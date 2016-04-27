Rails.application.routes.draw do
  devise_for :users, only: []

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :stories, only: [:create, :show]
      resources :sessions, only: [:create]
      resources :users, only: [:create, :update, :show]
    end
  end

end
