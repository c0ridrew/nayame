Rails.application.routes.draw do

  devise_for :users
  root :to => "lp#index"

  resources :lp, only: [:index]
  resources :nayame, only: [:index, :show, :edit]


  post 'auth', to: 'users#auth'
  post 'registration', to: 'users#registration'
  get 'sign_in', to: 'users#sign_in'
  get 'sign_up', to: 'users#sign_up'

end
