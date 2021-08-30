class Api::V1::SessionsController < ApplicationController
  def login 
    account = Account.find_by(name: params[:name])
    if account && account.authenticate(params[:password])
      render json: account
    else
      render json: {error: "login failed!!"}
    end
  end
end
