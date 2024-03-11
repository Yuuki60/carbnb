Rails.application.routes.draw do
  root to: "pages#home"
  resources :cars, only: [:index]
end
