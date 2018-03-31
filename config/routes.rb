Rails.application.routes.draw do

  devise_for :users

  # ADMIN PAGES

  get '/admin', to: 'admin/calendar#index'

  namespace :admin do
    resources :calendar, only: [:index]
    resources :bookings do
      collection do
        get 'all-bookings'
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
        get 'new_arrivals'
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

  # CLIENT PAGES

  namespace :client do
    resources :bookings, only: [:show, :update] do
      member do
        get 'film'
      end
      resources :playlines, only: [:create]
      resources :song_choices, only: [:index, :create, :destroy]
    end

    resources :playlines, only: [:destroy, :edit, :update] do
      collection do
        patch 'set_order'
      end
    end
  end

  # PUBLIC PAGES

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
