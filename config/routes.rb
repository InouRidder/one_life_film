Rails.application.routes.draw do
  get 'passwords/create'

  devise_for :users

  root to: 'pages#home'

  resources :films do
    resources :password, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
