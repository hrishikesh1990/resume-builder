Rails.application.routes.draw do
  root   'home#index'
  get    'edit'    => 'home#edit'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :profiles , only: [:update]
  resources :educations , only: [:new]
end
resources :hobbies, except: [:index, :show]
    resources :references, except: [:index, :show]
    resources :customs, except: [:index, :show]
    resources :snippets, except: [:index, :show]
  end

  
  resources :users, only: [:create, :edit, :update] do
    resources :gravatars, only: [:create, :edit, :update]
  end
