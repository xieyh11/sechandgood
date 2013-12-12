class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(userid: params[:session][:userid])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash[:error] = 'Invalid id/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end