Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'top#index'
   devise_for :users
  resources :users, only: [:index, :show]

   resources :reactions, only: [:create]
   resources :matching, only: [:index]
   resources :chat, only: [:create, :show]
end