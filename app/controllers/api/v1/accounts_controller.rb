class Api::V1::AccountsController < ApplicationController
  before_action :find_account, only: [:show]

  def index
    accounts = Account.all

    render json: accounts
  end

  def show
    render json: @account
  end

  def create
    account = Account.new(account_params)
    if account.save
      render json: account, status: :accepted
    else
      render json: {errors: account.errors.full_messages}
    end
  end


  private

  def account_params
    params.require(:account).permit(:name, :password)
  end

  def find_account
    @account = Account.find_by(id: params[:id])
  end
end
