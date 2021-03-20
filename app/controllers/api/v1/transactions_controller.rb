class Api::V1::TransactionsController < ApplicationController
  before_action :find_transaction, only: [:update, :destroy]
  before_action :find_account, only: [:index, :create]

  def index
    if @account
      transactions = @account.transactions
      # byebug

      render json: TransactionSerializer.new(transactions)
    end
  end

  def create
    transaction = @account.transactions.build(transaction_params)
    if transaction.save
      @account.update_balance(transaction)
      @account.save
      render json: TransactionSerializer.new(transaction), status: :accepted
    else
      render json: { errors: transaction.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
  end

  def destroy
    @account.update_balance_and_delete(@transaction);
    @transaction.destroy

    render json: { message: "Transaction Deleted." }    
  end

  private

  def transaction_params
    params.require(:transaction).permit(:description, :amount, :kind)
  end

  def find_transaction
    @transaction = Transaction.find_by(id: params[:id])
  end

  def find_account
    @account = Account.find_by(id: params[:account_id])
  end
end
