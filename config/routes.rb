Rails.application.routes.draw do

  root :to => "lp#index"
  devise_for :users, controllers: {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  resources :lp, only: [:index]
  resources :posts
  resources :relationships, only: [:create, :destroy]
  resources :answers, only: [:index, :show, :create, :destroy]
end
