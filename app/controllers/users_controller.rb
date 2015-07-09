class UsersController < ApplicationController
  def index
    @users = User.all
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "user updated."
    else
      redirect_to users_path, :alert => "unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path :notice => "user deleted."
  end

  private

  def secure_params
    params.require(:user).permit(:email, :password, :role)
  end
end
