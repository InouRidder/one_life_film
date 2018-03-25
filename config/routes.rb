Rails.application.routes.draw do

  devise_for :users

  get '/admin', to: 'admin/calendar#index'

  namespace :admin do
    resources :calendar, only: [:index]
    resources :bookings do
      collection do
        get 'all-bookings'
        get 'this-week'
        get 'old-bookings'
      end
      member do
        patch 'update_state'
        post 'send_reminder', to: 'bookings#send_reminder'
      end
      resources :comments, only: [:create]
    end
    resources :requests do
      member do
        patch 'approve'
        patch 'update_state'
      end
      resources :comments, only: [:create]
      collection do
        get 'cancelled_requests'
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
  end
  resources :films, only: [] do
    resources :comments, only: [:create]
  end

  resources :requests, only: [:create]

  resources :playbooks, only: [:show] do
    member do
      get 'songs'
      get 'film'
    end
    resources :playlines, only: [:create, :update]
    resources :song_choices, only: [:create, :destroy]
  end

  resources :playlines, only: [:destroy, :edit, :update] do
    collection do
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
    get 'contact', to: 'requests#new'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
