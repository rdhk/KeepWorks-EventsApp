class UsersController < ApplicationController

  before_action :ensure_not_signed_in

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Your signup was successful, please login to book tickets."
    else
      render action: 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :gender)
  end

end
