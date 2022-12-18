Rails.application.routes.draw do

  root to: "rooms#index"

  resources :rooms do
    resources :messages, only: %i[create]
  end

  resources :users, only: %i[new create edit]
  resource :sessions, only: %i[new create show destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
