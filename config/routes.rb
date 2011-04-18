Budgeter::Application.routes.draw do
  get "accounts/new"

  resources :transactions
  resources :accounts 
  root :to => "transactions#index"
end
