Rails.application.routes.draw do
  resources :account_transactions
  resources :clients

  get '/accounts/:id', to: 'accounts#show'
  post '/transfers', to: 'transfers#create'
end
