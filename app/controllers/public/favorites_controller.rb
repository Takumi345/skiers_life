class Public::FavoritesController < ApplicationController

  def create
    ski = Ski.find(params[:ski_id])
    favorite = current_user.favorites.new(ski_id: ski.id)
    favorite.save
    redirect_to ski_path(ski)
  end

  def destroy
    ski = Ski.find(params[:ski_id])
    favorite = current_user.favorites.find_by(ski_id: ski.id)
    favorite.destroy
    redirect_to ski_path(ski)
  end


end
