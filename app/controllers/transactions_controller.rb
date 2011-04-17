class TransactionsController < InheritedResources::Base
  def create
    create! { transactions_url } 
  end 
end
