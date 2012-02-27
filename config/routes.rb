Budgeter::Application.routes.draw do
  resources :transactions 


  root :to => "transactions#index"
end
