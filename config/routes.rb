Rails.application.routes.draw do

  root 'users#index'

  get '/auth/twitter/callback', to: 'sessions#create'
  delete '/sign_out', to: 'sessions#destroy'

  resources :users do
    resources :followers
  end

end
