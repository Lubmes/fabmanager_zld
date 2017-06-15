Rails.application.routes.draw do

  resources :events
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
    resources 'events' do
      member do
        get :approved
      end
    end
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
