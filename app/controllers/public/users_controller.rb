class Public::UsersController < ApplicationController

  def index
    @user = User.where(is_deleted: false)
  end

  def show
    @user = User.find(params[:id])
    @skis = @user.ski.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to public_user_path(current_user)
  end

  def confirm
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: false)
    sign_out current_user
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :email, :is_deleted)
  end

end
