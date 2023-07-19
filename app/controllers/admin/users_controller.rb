class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    user = User.find_by(id: params[:id])
    user.update(user_params)
    redirect_to admin_users_path
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :graduating_class, :role)
  end
end
