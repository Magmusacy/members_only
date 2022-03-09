class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_name(params[:name])

    if @user && @user.authenticate(params[:password])
      if params[:remember_token]
        cookies.permanent[:remember_token] = @user.remember_token
      else
        cookies[:remember_token] = @user.remember_token
      end

      redirect_to root_path, notice: "Congratulations! Logged in as #{@user.name} successfully."
    else
      flash.now[:alert] = "Something went wrong..."
      render :new
    end
  end

  def destroy
    cookies.delete :remember_token
    redirect_to root_path, notice: "Logged out successfully"
  end
end
