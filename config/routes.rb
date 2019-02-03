Rails.application.routes.draw do

  root :to => "lp#index"
  devise_for :users, controllers: {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :omniauth_callbacks => 'users/omniauth_callbacks'
  }

  resources :lp, only: [:index]
  resources :posts do
    collection do
      post 'tweet'
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :answers, only: [:index, :show, :create, :destroy]


end
