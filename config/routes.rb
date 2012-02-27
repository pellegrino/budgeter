Budgeter::Application.routes.draw do
  resources :transactions 
  resources :accounts 


  root :to => "accounts#index"
end
