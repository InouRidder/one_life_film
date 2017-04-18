Rails.application.routes.draw do
  get 'password', to: 'films#password'
  post 'password', to: 'films#password'
  devise_for :users
  resources :films

  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
