class  AccountsController < InheritedResources::Base
  before_filter :fetch_accounts , :only => [:new]
  def create
    create! { transactions_url }
  end
end
