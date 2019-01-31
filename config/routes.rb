Rails.application.routes.draw do
  devise_for :users

  root 'pages#home'
  
  devise_scope :user do
    get 'signup', to: 'users/registrations#new'
    post 'signup', to: 'users/registrations#create'
    get 'login', to: 'users/sessions#new'
    post 'login', to: 'users/sessions#create'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
