class TransactionsController < InheritedResources::Base
  before_filter :fetch_accounts , :only => [:index, :new]
  
  def create
    create! { transactions_url } 
  end
  
  def account
    @transactions = Transaction.for_an_account_name params[:name]
  end
  
  protected
  def fetch_accounts
    @accounts = Account.all
  end 
    
end
