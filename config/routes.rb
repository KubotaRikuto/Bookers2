Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users

  resources :books, only: [:create, :index, :show, :edit, :update, :destroy ]

  resources :users, only: [:index, :show, :edit, :update ]

  # resources :users, only: [:show, :edit, :update]
  get 'homes/about' => 'homes/about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
