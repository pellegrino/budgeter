Budgeter::Application.routes.draw do
  resources :transactions do
    collection do
      get "accounts/:name" , :action => :account , :as => "account"
    end
  end
  resources :accounts
  root :to => "transactions#index"
end
