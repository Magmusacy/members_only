class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_name(params[:name])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Congratulations! Logged in as #{@user.name} successfully."
    else
      flash.now[:alert] = "Something went wrong..."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully"
  end
end
