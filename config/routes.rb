Rails.application.routes.draw do

  resources :meetings
  namespace :admin do
    root 'application#show'
    resources 'users' do
      member do
        patch :archive
      end
    end
    resources 'programs'
    resources 'materials'
    resources 'machines'
    resources 'reservations'
    resources 'rentings'
    resources 'information'
  end

  devise_for :users

  resources 'information'
  resources 'users'
  resources :avatar

  root 'fabmoments#show'
  get '/fabmoment/show', :controller => 'fabmoments', :action => "show"
  post '/fabmoment/show', :controller => 'fabmoments', :action => "show"

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
