class ApplicationController < ActionController::Base
  protect_from_forgery

  def fetch_accounts
    @accounts = Account.all
  end
end
