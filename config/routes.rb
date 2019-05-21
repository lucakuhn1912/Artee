Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrailsrails .org/routing.html
  resources :arts do
    resources :leases, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end

  resources :leases, except: [:new, :create]

  resources :users, only: [:show, :edit, :update]
end
