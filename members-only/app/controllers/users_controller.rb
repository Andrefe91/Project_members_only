class UsersController < ApplicationController

  def new
    @user = User.new()
  end

  def create
    @user = User.new(valid_user_parameters)

    if @user.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
  end


  private

  def valid_user_parameters
    params.require(:user).permit(:username, :email, :password)
  end
end
