Rails.application.routes.draw do

  root :to => "lp#index"
  devise_for :users, controllers: {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  resources :lp, only: [:index]
  resources :nayame, only: [:index, :show, :edit]

end
