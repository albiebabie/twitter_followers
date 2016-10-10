Rails.application.routes.draw do

  root 'users#index'

  get '/auth/twitter/callback', to: 'sessions#create'

  resources :users


end
