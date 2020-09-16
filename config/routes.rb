Rails.application.routes.draw do
  resources :friendships, only: [:create]
  resources :likes, only: [:create]
  resource :comments, only: [:new, :create]
  resources :posts, only: [:index, :show, :new, :create, :destroy]
  resources :static_pages
  resources :users, only: [:index, :show]
  devise_for :users

  root 'static_pages#home'

  devise_scope :user do
    # register
    get 'signup', to: 'devise/registrations#new'
    # login
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end
end
