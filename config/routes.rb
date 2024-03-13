Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :orders, only: [:index]
  resources :cars, only: [:index, :new, :create, :show, :destroy] do
    resources :orders, only: [:create]
  end
end
