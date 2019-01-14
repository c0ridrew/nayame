Rails.application.routes.draw do

  root :to => "lp#index"
  devise_for :users, controllers: {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  resources :lp, only: [:index]
  resources :posts
  resources :relationships, only: [:create, :destroy]
  get 'browse', to: 'posts#browse'
  post 'receive_answer/:id', as: 'receive_answer', to: 'answers#receive_answer'
  get 'send_answer/:id', as: 'send_answer', to: 'answers#send_answer'
  get 'complete', to: 'answers#complete'
end
