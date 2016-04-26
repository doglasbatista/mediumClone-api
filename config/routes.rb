Rails.application.routes.draw do
  devise_for :users, only: []

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :sessions, only: [:create]
      resources :users, only: [:create, :update]
    end
  end

end
