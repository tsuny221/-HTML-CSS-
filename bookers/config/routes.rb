Rails.application.routes.draw do
root to: 'homes#top'
get 'home/about' => 'homes#about'
devise_for :users
resources :books 
root 'books#index'
resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
