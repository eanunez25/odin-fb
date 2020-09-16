Rails.application.routes.draw do
  resource :comments, only: [:new, :create]
  resources :posts, only: [:index, :show, :new, :create]
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
