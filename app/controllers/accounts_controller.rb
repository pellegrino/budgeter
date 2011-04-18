class  AccountsController < InheritedResources::Base
  def create
    create! { transactions_url } 
  end 
end
