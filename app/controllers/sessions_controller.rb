class SessionsController < ApplicationController
  before_action :ensure_not_signed_in, only:[:new, :create]
  before_action :authenticate, only: [:destroy]

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])

    if(@user && @user.authenticate(params[:session][:password]))
      session[:user_id] = @user.id
      redirect_to root_path, notice: "You have been successfully logged in."
    else
      redirect_to login_path, alert: "Invalid username/password combination or invalid user."
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "You have been successfully logged out."
  end
end
