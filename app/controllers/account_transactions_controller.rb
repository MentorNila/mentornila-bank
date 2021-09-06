class AccountTransactionsController < ApplicationController

  # GET /account_transactions
  def index
    @account_transactions = AccountTransaction.all

    render json: @account_transactions
  end

end
