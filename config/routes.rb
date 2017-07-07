Rails.application.routes.draw do
  get '/redirect', to: 'events_api#redirect', as:'redirect'
  get '/callback', to: 'events_api#callback', as:'callback'
  get '/calendars', to: 'events_api#calendars', as: 'calendars'
  get '/events_api/:calendar_id', to: 'events_api#retrieve_events', as: 'events_api', calendar_id: /[^\/]+/
  resources :events, controller: 'events'

  resources :meetings
  namespace :admin do
    root 'application#index'
    resources 'users' do
      member do
        patch :archive
      end
    end
    resources 'programs'
    resources 'materials'
    resources 'machines'
    resources 'occupation'
    resources 'rentings'
    resources 'information'
    resources 'fabmoments' do
      member do
        get :staff_pick
      end
    end
    resources 'events' do
      member do
        get :approved
      end
    end
    get 'fabmanager_settings/1', to: 'fabmanager_settings#settings'
    resources 'fabmanager_settings', only: [:update]
  end

  devise_for :users

  resources 'information'
  resources 'users'
  resources :avatar
  resources 'machines' do
    member do
      get :take
      get :leave
    end
  end



  root 'fabmoments#index'
  get '/fabmoment/index', :controller => 'fabmoments', :action => "index"
  post '/fabmoment/index', :controller => 'fabmoments', :action => "index"

  resources 'fabmoments' do
    member do
      get :like
      get :unlike
    end
    collection do
      get :search
    end
    resources 'tags' do
      member do
        delete :remove
      end
    end
    resources 'project_files', only: [:create, :destroy]
    resources 'comments', only: [:create, :edit, :update, :destroy]
  end
end
