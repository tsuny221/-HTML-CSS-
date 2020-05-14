Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :index, :update]
  root 'homes#top'
  resources :posts do
 	resource :post_comments, only: [:create, :destroy]
 	resource :likes, only: [:create, :destroy]
 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
