Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  ActiveAdmin.routes(self)


  get 'password', to: 'films#password'
  post 'password', to: 'films#password'
  resources :films

  # custom pages

  root to: 'pages#home'
  get 'gallery', to: 'pages#gallery'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'test', to: 'pages#test'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
