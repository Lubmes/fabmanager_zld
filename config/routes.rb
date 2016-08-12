Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'

    resources 'fabmoments', only: [:destroy]
    resources 'users' do
      member do 
        patch :archive
      end
    end
  end

  devise_for :users
  root 'fabmoments#index'
  resources 'fabmoments', except: [:destroy]
end
