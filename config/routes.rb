Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'
  end

  devise_for :users
  root 'fabmoments#index'
  resources 'fabmoments'
end
