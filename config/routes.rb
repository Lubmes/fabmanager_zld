Rails.application.routes.draw do
  
  namespace :admin do
    root 'application#index'
    resources 'users' do
      member do 
        patch :archive
      end
    end
  end

  devise_for :users
    
  root 'fabmoments#index'
  resources 'fabmoments' do
    resources 'tags' do
      member do
        delete :remove
      end
    end
    resources 'project_files', only: [:create, :destroy]
  end
end
