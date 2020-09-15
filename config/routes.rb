Rails.application.routes.draw do
  resources :static_pages
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
