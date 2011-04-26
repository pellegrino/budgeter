class TransactionsController < InheritedResources::Base
  before_filter :fetch_accounts , :only => [:index, :new, :account]

  def create
    create! { transactions_url }
  end

  def account
    @account = Account.find_by_name params[:name]
    if @account
      @transactions = @account.transactions
    else
      flash[:alert] = I18n.t("transaction.account.not_found")
      redirect_to root_path
    end
  end
end
