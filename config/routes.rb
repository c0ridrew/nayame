Rails.application.routes.draw do

  resources :lp, only: [:index]
  resources :nayame, only: [:index, :show, :edit]


  post 'session', to: 'users#session'
  post 'registration', to: 'users#registration'
  get 'sign_in', to: 'users#sign_in'
  get 'sign_up', to: 'users#sign_up'

end
