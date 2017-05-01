Rails.application.routes.draw do

  devise_for :users

  # without the following devise & active_admin are not friends, bug unsolved

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  ActiveAdmin.routes(self)

  get 'password', to: 'films#password'
  post 'password', to: 'films#password'

  resources :films
  resources :requests, only: [:create]

  # custom pages

  root to: 'pages#home'
  get 'gallery', to: 'pages#gallery'
  get 'about', to: 'pages#about'

  get 'contact', to: 'requests#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
