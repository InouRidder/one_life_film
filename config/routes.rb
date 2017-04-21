Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get 'password', to: 'films#password'
  post 'password', to: 'films#password'
  devise_for :users
  resources :films

  # custom pages

  root to: 'pages#home'
  get 'gallery', to: 'pages#gallery'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
