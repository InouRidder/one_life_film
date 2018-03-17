Rails.application.routes.draw do

  devise_for :users

  # without the following devise & active_admin are not friends, bug unsolved
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  get '/admin', to: 'admin/dashboards#show'

  get 'playlines/:id', to: 'playlines#update'

  namespace :admin do
    resources :bookings do
      collection do
        get 'all-bookings'
        get 'this-week'
        get 'old-bookings'
        get 'old-requests'
      end
      member do
        patch 'approve', to: 'bookings#approve'
        post 'send_reminder', to: 'bookings#send_reminder'
      end
    end
    resources :songs, except: [:show] do
      collection do
        get 'begin'
        get 'middle'
        get 'end'
      end
    end
    resources :films
    get 'aanvragen', to: 'bookings#requests'
  end

  resources :bookings, only: [:create]

  resources :playbooks, only: [:show] do
    member do
      get 'songs'
    end
    resources :playlines, only: [:create, :update]
    resources :song_choices, only: [:create, :destroy]
  end

  resources :playlines, only: [:destroy, :edit, :update] do
    member do
      patch 'set_order'
    end
  end


  scope :admin do
    resources :bookings
  end

  scope '(:locale)', locale: /nl|en/ do

    root to: 'pages#home'
    resources :films, only: [:show]

    # custom pages
    get 'password', to: 'films#password'
    post 'password', to: 'films#password'
    get 'gallery', to: 'pages#gallery'
    get 'about', to: 'pages#about'
    get 'contact', to: 'bookings#new'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
