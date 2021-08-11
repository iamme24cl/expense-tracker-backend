class Api::V1::SessionsController < ApplicationController
  def create 
    account = Account.find_by(name: params[:name])
    if account && account.authenticate(params[:password])
      session[:account_id] = account.id
      render json: account
    else
      render json: {error: "login failed!!"}
    end
  end
end
