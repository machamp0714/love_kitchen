Rails.application.routes.draw do
  devise_for :users, skip: :all
  devise_scope :user do
    get 'signup', to: 'users/registrations#new'
    post 'signup', to: 'users/registrations#create'
    get 'setting/profile', to: 'users/registrations#edit'
    patch 'setting/profile', to: 'users/registrations#update'
    get 'login', to: 'users/sessions#new'
    post 'login', to: 'users/sessions#create'
    delete 'logout', to: 'users/sessions#destroy'
  end

  get 'setting/password', to: 'users#edit'
  patch 'setting/password', to: 'users#update_password'

  scope do
    resources :users, only: :show, path: '/'
  end

  resources :articles

  root 'pages#home'
end
