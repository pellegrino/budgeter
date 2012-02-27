Budgeter::Application.routes.draw do
  resources :transactions 
  resources :accounts 


  root :to => "transactions#index"
end
