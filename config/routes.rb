Budgeter::Application.routes.draw do
  resources :transactions 
  resources :accounts 


  root :to => "accounts#index"
  # omniauth
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
end
