Rails.application.routes.draw do
  devise_for :users

  resources :lp, only: [:index]
  resources :nayame, only: [:index, :show, :edit]

end
