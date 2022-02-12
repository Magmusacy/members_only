class UsersController < ApplicationController
  # create user
  # update user
  # delete user

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Congratulations! User created successfully."
      redirect_to root_path
    else
      flash.now[:alert] = "Something went wrong..."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
