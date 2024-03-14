Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :orders, only: [:index]

  put '/orders/:id/cancel', to: 'orders#cancel_order', as: 'cancel_order'
  put '/orders/:id/accept', to: 'orders#accept_order', as: 'accept_order'
  put '/orders/:id/decline', to: 'orders#decline_order', as: 'decline_order'
  resources :cars do
    resources :orders, only: [:create]
  end
end
