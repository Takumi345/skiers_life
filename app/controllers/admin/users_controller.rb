class Admin::UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @skis = @user.ski.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :email, :is_deleted)
  end

end
