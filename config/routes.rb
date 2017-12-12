Rails.application.routes.draw do

  devise_for :users

  # without the following devise & active_admin are not friends, bug unsolved
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  ActiveAdmin.routes(self)

  resources :requests, only: [:create]
  resources :playbooks, only: [:show], shallow: true do
    resources :playlines, only: [:create, :destroy, :edit, :update] do
      member do
        patch 'set_order'
      end
    end
  end

  scope '(:locale)', locale: /nl|en/ do

    root to: 'pages#home'
    resources :films

    # custom pages
    get 'password', to: 'films#password'
    post 'password', to: 'films#password'
    get 'gallery', to: 'pages#gallery'
    get 'about', to: 'pages#about'
    get 'contact', to: 'requests#new'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
