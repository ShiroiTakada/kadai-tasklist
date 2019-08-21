Rails.application.routes.draw do
  get 'toppages/index'
root to: 'toppages#index'

get 'signup', to: 'users#new'
resources :users, only: [:index, :show, :new, :create]

end
