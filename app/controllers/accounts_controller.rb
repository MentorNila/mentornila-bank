class AccountsController < ApplicationController

  # GET /accounts/1
  def show
    @account = Account.find(params[:id])
    render json: {balance: @account.balance, last_ten_transactions: @account.account_transactions.last(10)}
  end

end
