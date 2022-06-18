class Public::UsersController < ApplicationController
  def show
    @user = User.id
    @skis = @user.skis
  end

  def edit
  end

  def update
  end

  def confirm
  end

  def withdraw
  end
end
