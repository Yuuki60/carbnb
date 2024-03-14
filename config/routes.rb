Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :orders, only: [:index]
  resources :cars do
    resources :orders, only: [:create]
  end
end
