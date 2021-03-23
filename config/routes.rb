Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :transactions, only: [:show]
      resources :accounts, only: [:index, :show] do
        resources :transactions, only: [:index, :create, :update, :destroy]
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
