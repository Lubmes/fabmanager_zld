Rails.application.routes.draw do
  devise_for :users
  root 'fabmoments#index'
  resources 'fabmoments'
end
