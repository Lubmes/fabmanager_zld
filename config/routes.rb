Rails.application.routes.draw do
  root 'fabmoments#index'
  resources 'fabmoments'
end
