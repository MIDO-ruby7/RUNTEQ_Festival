class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  def index
    @users = User.all
  end

  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to posts_path, notice: 'ユーザー情報を更新しました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:nicknamename, :graduating_class)
  end
end
